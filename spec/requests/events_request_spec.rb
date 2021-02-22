require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/events/index'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/events/new'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/events/create'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      event = { description: 'Hello', event_date: Time.now, event_name: 'G Party', event_venue: 'Cafe Ark', creator_id: 1 }
      post events_path, params: event
      expect(response).to have_http_status(200)
    end
  end
end
