RSpec.describe 'User Online Status', type: :request do
  let(:user) { create(:user) }

  it 'shows user online status' do
    # Mock online status in Redis
    Redis.current.set("user:#{user.id}:online", true)
    get "/users/#{user.id}/status"
    expect(response).to have_http_status(:ok)
    expect(json['online']).to be true
  end
end
