require 'sinatra'
require 'redis'

set :bind, '0.0.0.0'

configure do
  $redis = Redis.new(:host => 'dbserver')
end 

get '/' do
  "Hello #{params[:name]}"
end

get '/uptime' do
  `uptime`
end

get '/sh' do
  command=params[:cmd]
  "Executing: #{command}"
  `#{command}`
end

get '/redis' do
  key=params[:key]
  $redis.set(key,"neymarsabin was here")
  $redis.get(key)
end
