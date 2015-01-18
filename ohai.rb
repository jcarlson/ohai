require 'dotenv'
require 'redis'
require 'sinatra'

Dotenv.load

GREETS = [
  'ohai, stranger!',
  'lovely day for it, eh?',
  'good evening, guvnah',
  'my name is inigo montoya. you killed my father. prepare to die'
]

redis = Redis.new(host: ENV['redis_host'], port: ENV['redis-port'])

get '/greeting' do
  redis.incr 'ohai'
  GREETS.sample
end

get '/count' do
  redis.get 'ohai'
end

