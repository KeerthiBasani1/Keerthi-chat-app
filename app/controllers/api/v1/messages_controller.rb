class Api::V1::MessagesController < ApplicationController
	def create
		message = Message.new(message_params)
		if message.save
		  ActionCable.server.broadcast "chat_#{message.chat_room_id}", message: message
		  render json: message, status: :created
		else
			render json: message.errors, status: :unprocessable_entity
		end
	end

	private

	def message_params
		params.require(:message).permit(:content, :user_id, :chat_room_id)
	end
end
