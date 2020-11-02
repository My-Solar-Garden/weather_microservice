class Weather
  attr_reader :temperature, :humidity, :description, :daily
  def initialize(data)
    @temperature = data[:current][:temp]
    @humidity = data[:current][:humidity]
    @description = data[:current][:weather][0][:description]
    @daily = data[:daily]
  end
end