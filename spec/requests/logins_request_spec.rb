require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  describe 'logins#new' do
    it 'returns http success' do
      get new_login_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'logins#create' do
    it 'returns http success' do
      signin = { username: 'Gango' }
      post logins_path, params: signin
      expect(response).to have_http_status(200)
    end
  end

  describe 'logins#destroy' do
    it 'returns http success' do
      get signout_path
      expect(response).to have_http_status(302)
      expect(session[:user_id]).to be nil
    end
  end
end
