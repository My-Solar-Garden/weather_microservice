require './config/environment'
class ApplicationController < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get "/" do
    JSON.generate(message: "Welcome to the Sinatra Template!")
  end

  get "/api/v1/forecast" do
    lat = params[:lat]
    lon = params[:lon]

    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |f|
      f.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['exclude'] = 'minutely,hourly'
    end
    # require "pry"; binding.pry
    # parsed_json = JSON.parse(response.body, symbolize_names: true)
    JSON.generate(response)
  end
end
