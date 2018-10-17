require 'rails_helper'

RSpec.describe 'Weatherstations API', type: :request do

  # initialize test data
  let!(:weatherstations) { create_list(:weatherstation, 10) }
  let(:weatherstation_id) { weatherstations.first.id }

  # Test suite for GET /api/weatherstations
  describe 'GET /api/weatherstations' do
    # make HTTP get request before each example
    before { get '/api/weatherstations' }

    it 'returns weatherstations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    # ensure that the request is 'ok' - i.e. it has succeeded:
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/weatherstations/:id
  describe 'GET /api/weatherstations/:id' do
    before { get "/api/weatherstations/#{weatherstation_id}" }

    # we have two scenarios when we are looking for a specific weatherstation:
    # 1. the weatherstation exists:
    context 'when the weatherstation exists' do
      it 'returns the weatherstation' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(weatherstation_id)
      end

      # ensure that the request is 'ok' - i.e. it has succeeded:
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    # 2. the weatherstation doesn't exist:
    context 'when the weatherstation does not exist' do
      let(:weatherstation_id) { 100 }

      # ensure that the server shows that it could not find what was requested:
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Weatherstation/)
      end
    end
  end

  # Test suite for POST /api/weatherstations
  describe 'POST /api/weatherstations' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm' } }

    context 'when the request is valid' do
      before { post '/api/weatherstations', params: valid_attributes }

      it 'creates a weatherstation' do
        expect(json['name']).to eq('Learn Elm')
      end

      # ensure that the request has been fulfilled and one or more new resources has been created:
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/weatherstations', params: { } }

      # ensure that the code returned matches the fact that the content of the request was understood, but not valid:
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/weatherstations/:id
  describe 'PUT /api/weatherstations/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the weatherstation exists' do
      before { put "/api/weatherstations/#{weatherstation_id}", params: valid_attributes }

      it 'updates the weatherstation' do
        expect(response.body).to be_empty
      end

      # ensure the code returned by the server is that the request has been fulfilled and there is 'no additional content to send in the payload body'
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /api/weatherstations/:id
  describe 'DELETE /api/weatherstations/:id' do
    before { delete "/api/weatherstations/#{weatherstation_id}" }

    # ensure the code returned by the server is that the request has been fulfilled and there is 'no additional content to send in the payload body'
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
