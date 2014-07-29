require 'sinatra'
require 'yahoo_weatherman'

get '/' do
    erb :home
end

post '/weather' do
	@post = params[:post]['location']
	@weather = get_weather(@post)
    "#{@weather}"
#     weather = current_weather
    if (@weather == 'isolated thunderstorms')
        erb :thunderstorms
    elsif (@weather == 'scattered thunderstorms')
        erb :thunderstorms
    elsif (@weather == 'partly cloudy')
        erb :cloudy
    elsif (@weather == 'mostly cloudy')
        erb :cloudy    
    elsif (@weather == 'cloudy')
        erb :cloudy
    elsif (@weather == 'mostly sunny')
        erb :sunny
    elsif (@weather == 'sunny')
        erb :sunny
    else
        erb :default
    end
    
end

def get_weather(post)
	client = Weatherman::Client.new
	puts "hellllllllooooo #{post}" #used for testing
	user_city = post.downcase.to_s
	city_id = client.lookup_by_location(user_city)
	city_id = client.lookup_by_location(user_city)
	@city_name = city_id.location.to_a[0]
	weather_forecast = city_id.forecasts[0].to_a
	@current_weather = weather_forecast[5].to_a
	@current_weather = @current_weather[1].downcase
end


