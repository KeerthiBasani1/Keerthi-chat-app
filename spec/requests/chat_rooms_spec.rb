RSpec.describe 'ChatRooms', type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }

  it 'creates a chat room' do
    post '/chat_rooms', params: { chat_room: { name: 'General' } }, headers: auth_headers
    expect(response).to have_http_status(:created)
  end

  it 'lists all chat rooms' do
    create(:chat_room, name: 'General')
    get '/chat_rooms', headers: auth_headers
    expect(response).to have_http_status(:ok)
  end
end
