# hello.rb

# simple Hello world demo with Sinatra
# Tutorial from 
#http://code.tutsplus.com/tutorials/singing-with-sinatra--net-18965


require 'rubygems'
require 'sinatra'


get '/' do 
	"Hello world, its #{Time.now} at the server."

end

get '/about' do
	"A little about me :)"
end

get '/hello/:name' do
	params[:name]
	"Your name reversed is: #{params[:name].upcase.reverse}"
end

get '/hello/:name/:city' do
	"Hello #{params[:name].capitalize} from #{params[:city]}"
end

get '/more/*' do
	params[:splat]
end

# display form.erb file to retreive information
get '/form' do
	erb :form
end

# posts the results from the get
post '/form' do
	"You said '#{params[:message]}'"
end

get '/secret' do
	erb :secret
end
# Simple manipulation of variable from secret.erb
post '/secret' do
	params[:secret].reverse
end

# Have to paste the secret message into the URL
# not same secret as above.
get '/decrypt/:secret' do
	params[:secret].reverse
end

# simple 404 error message
not_found do
	status 404
	'not found'
end

