require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }

  it 'registers a new user' do
    post '/signup', params: { user: { email: 'test@example.com', password: 'password' } }
    expect(response).to have_http_status(:created)
  end

  it 'logs in a user' do
    post '/login', params: { email: user.email, password: 'password' }
    expect(response).to have_http_status(:ok)
    expect(response.headers['Authorization']).to be_present
  end

  it 'resets password' do
    post '/password/reset', params: { email: user.email }
    expect(response).to have_http_status(:ok)
  end
end
