require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    body = JSON.parse(last_response.body, symbolize_names: true)

    expect(body[:message]).to include("Welcome to the Sinatra Template!")

  end

  it "can return current weather for a geolocation" do
     lat = 39.738453
     lon  = -104.984853
     get "/api/v1/forecast?lat=#{lat}&lon=#{lon}"
     require "pry"; binding.pry
     response = JSON.parse(last_response.body, symbolize_names: true)
     expect(response.keys).to eq([:lat, :lon, :timezome, :timezone_offset, :current, :daily])
  end
end
