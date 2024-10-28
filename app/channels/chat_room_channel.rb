class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:chat_room_id]}"
  end


  def receive(data)
    Message.create!(
      content: data['content'],
      user_id: data['user_id'],
      chat_room_id: params['chat_room_id']
    )
    ActionCable.server.broadcast("chat_room_#{params['chat_room_id']}", message: render_message(message))
  end


  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end


end
