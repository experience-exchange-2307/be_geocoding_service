require 'rails_helper'

RSpec.describe "geocode address", type: :request do
  describe "GET '/api/v1/coordinates", :vcr do
    it "returns coordinates from the geoapify API" do
      get "/api/v1/coordinates", params: { address: "38 Upper Montagu Street, London W1H 1LJ, United Kingdom" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body).to have_key(:lat)
      expect(response_body).to have_key(:lon)
      expect(response_body[:lat]).to be_a(Float)
      expect(response_body[:lon]).to be_a(Float)
    end

    it "returns an error message if coordinates are not present" do 
      get "/api/v1/coordinates", params: { address: "**" }

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to_not have_key(:coordinates)

      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq('Coordinates not found')
    end
  end
end
