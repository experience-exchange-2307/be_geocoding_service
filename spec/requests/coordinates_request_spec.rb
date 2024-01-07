require 'rails_helper'

RSpec.describe "geocode address", type: :request do
  describe "GET '/api/v1/coordinates", :vcr do
    it "returns coordinates from the geoapify API" do
      get "/api/v1/coordinates", params: { address: "38 Upper Montagu Street, London W1H 1LJ, United Kingdom" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      coordinates = response_body[:coordinates]
      expect(coordinates).to have_key(:lat)
      expect(coordinates).to have_key(:lon)
      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lon]).to be_a(Float)
    end

    it "returns an error message if coordinates are not present" do 
      get "/api/v1/coordinates", params: { address: "**" }

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      coordinates = response_body[:coordinates]
      expect(coordinates).to_not have_key(:lat)
      expect(coordinates).to_not have_key(:lon)

      expect(coordinates).to have_key(:error)
      expect(coordinates[:error]).to eq('Coordinates not found')
    end
  end
end
