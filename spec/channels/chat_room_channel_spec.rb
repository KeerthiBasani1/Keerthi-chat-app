require 'rails_helper'

RSpec.describe ChatRoomChannel, type: :channel do
  let(:user) { create(:user) }
  let(:chat_room) { create(:chat_room) }

  it 'subscribes to a chat room stream' do
    subscribe(chat_room_id: chat_room.id)
    expect(subscription).to be_confirmed
  end

  it 'broadcasts a message' do
    subscribe(chat_room_id: chat_room.id)
    perform :send_message, content: 'Hello, world!'
    expect(transmissions.last['content']).to eq('Hello, world!')
  end

end
