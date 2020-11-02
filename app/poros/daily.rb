class Daily
  attr_reader :temperature, :humidity, :description
  def initialize(data)

    @temperature = data[:daily][:temp]
    @humidity = data[:daily][:humidity]
    @description = data[:daily][:weather][0][:description]
  end
end