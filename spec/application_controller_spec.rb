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
     response = JSON.parse(last_response.body, symbolize_names: true)

     expect(response).to have_key(:lat)
     expect(response[:lat]).to be_a(Float)
     expect(response).to have_key(:lon)
     expect(response[:lon]).to be_a(Float)
     expect(response).to have_key(:current)
     expect(response[:current]).to be_a(Hash)

     expect(response[:current]).to have_key(:temp)
     expect(response[:current][:temp]).to be_a(Float)
     expect(response[:current]).to have_key(:humidity)
     expect(response[:current][:humidity]).to be_an(Integer)
     expect(response[:current]).to have_key(:weather)
     expect(response[:current][:weather]).to be_an(Array)
     expect(response[:current][:weather].first).to have_key(:description)
     expect(response[:current][:weather].first[:description]).to be_a(String)
  end

  it "can return 7 day forecast for a geolocation" do
    lat = 39.738453
    lon  = -104.984853
    get "/api/v1/forecast?lat=#{lat}&lon=#{lon}"
    response = JSON.parse(last_response.body, symbolize_names: true)
    # require "pry"; binding.pry

    expect(response).to have_key(:daily)
    expect(response[:daily]).to be_an(Array)
    expect(response[:daily].count).to eq(8)
    expect(response[:daily].first).to be_a(Hash)

    expect(response[:daily].first[:weather].first).to have_key(:description)
    expect(response[:daily].first[:weather].first[:description]).to be_a(String)
    expect(response[:daily].first).to have_key(:humidity)
    expect(response[:daily].first[:humidity]).to be_an(Integer)
    expect(response[:daily].first[:temp]).to have_key(:day)
    expect(response[:daily].first[:temp][:day]).to be_a(Float)
  end
end
