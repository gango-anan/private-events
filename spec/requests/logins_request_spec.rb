require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/logins/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/logins/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/logins/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
