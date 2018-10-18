require 'rails_helper'

RSpec.describe 'Climatedatas API' do
  # Initialize the test data
  let!(:weatherstation) { create(:weatherstation) }
  let!(:climatedatas) { create_list(:climatedata, 20, weatherstation_id: weatherstation.id) }
  let(:weatherstation_id) { weatherstation.id }
  let(:id) { climatedatas.first.id }

  # Test suite for GET /api/weatherstations/:weatherstation_id/climatedatas
  describe 'GET /api/weatherstations/:weatherstation_id/climatedatas' do
    before { get "/api/weatherstations/#{weatherstation_id}/climatedatas" }

    context 'when weatherstation exists' do
      # ensure that the request is 'ok' - i.e. it has succeeded:
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all weatherstation climatedatas' do
        expect(json.size).to eq(20)
      end
    end

    context 'when weatherstation does not exist' do
      let(:weatherstation_id) { 0 }

      # ensure that the server shows that it could not find what was requested:
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Weatherstation/)
      end
    end
  end

  # Test suite for GET /api/weatherstations/:weatherstation_id/climatedatas/:id
  describe 'GET /api/weatherstations/:weatherstation_id/climatedatas/:id' do
    before { get "/api/weatherstations/#{weatherstation_id}/climatedatas/#{id}" }

    context 'when weatherstation climatedata exists' do
      # ensure that the request is 'ok' - i.e. it has succeeded:
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the climatedata' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when weatherstation climatedata does not exist' do
      let(:id) { 0 }

      # ensure that the server shows that it could not find what was requested:
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Climatedata/)
      end
    end
  end

  # Test suite for PUT /api/weatherstations/:weatherstation_id/climatedatas
  describe 'POST /api/weatherstations/:weatherstation_id/climatedatas' do
    let(:valid_attributes) { { max_temp: 23.6, min_temp: 12.4, mean_temp: 17.8, total_rainfall: 33.8, total_sunshine: 200.3, month: 7, year: 1978 } }

    context 'when request attributes are valid' do
      before { post "/api/weatherstations/#{weatherstation_id}/climatedatas", params: valid_attributes }

      # ensure that the request has been fulfilled and one or more new resources has been created:
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/api/weatherstations/#{weatherstation_id}/climatedatas", params: {} }

      # ensure that the code returned matches the fact that the content of the request was understood, but not valid:
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Min temp can't be blank, Max temp can't be blank, Mean temp can't be blank, Total rainfall can't be blank, Total sunshine can't be blank, Month can't be blank, Year can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/weatherstations/:weatherstation_id/climatedatas/:id
  describe 'PUT /api/weatherstations/:weatherstation_id/climatedatas/:id' do
    let(:valid_attributes) { { max_temp: 22.6, min_temp: 10.4, mean_temp: 15.8, total_rainfall: 70.8, total_sunshine: 100.3, month: 7, year: 1978 }}

    before { put "/api/weatherstations/#{weatherstation_id}/climatedatas/#{id}", params: valid_attributes }

    context 'when climatedata exists' do
      # ensure the code returned by the server is that the request has been fulfilled and there is 'no additional content to send in the payload body'
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the climatedata' do
        updated_climatedata = Climatedata.find(id)
        expect(updated_climatedata.max_temp).to match(22.6)
        expect(updated_climatedata.min_temp).to match(10.4)
        expect(updated_climatedata.mean_temp).to match(15.8)
        expect(updated_climatedata.total_rainfall).to match(70.8)
        expect(updated_climatedata.total_sunshine).to match(100.3)
        expect(updated_climatedata.month).to match(7)
        expect(updated_climatedata.year).to match(1978)
      end
    end

    context 'when the climatedata does not exist' do
      let(:id) { 0 }

      # ensure that the server shows that it could not find what was requested:
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Climatedata/)
      end
    end
  end

  # Test suite for DELETE /api/weatherstations/:weatherstation_id/climatedatas/:id
  describe 'DELETE /api/weatherstations/:weatherstation_id/climatedatas/:id' do
    before { delete "/api/weatherstations/#{weatherstation_id}/climatedatas/#{id}" }

    # ensure the code returned by the server is that the request has been fulfilled and there is 'no additional content to send in the payload body'
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
