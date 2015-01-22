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

# redis = Redis.new(host: ENV['redis_host'], port: ENV['redis-port'])

GREETINGS = 0

get '/greeting' do
  GREETINGS += 1
  GREETS.sample
end

get '/count' do
  GREETINGS.to_s
end

