class WeatherFinder
  def initialize(city_name)
    @name = city_name
  end

  def call
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{@name}&appid=#{ENV['APPID']}")
    return unless response.success?

    (response['main']['temp'] - 272.15).round
  end
end
