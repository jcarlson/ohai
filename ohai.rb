require 'dotenv'
require 'redis'
require 'sinatra'

require 'byebug'
require 'pry-byebug'

Dotenv.load

# TODO: Improve configuration such that it works in and out of container
Byebug.start_server '0.0.0.0', 3001
redis = Redis.new(host: 'redis', port: '6379')

GREETS = [
  'Ohai, stranger!',
  'Lovely day for it, eh?',
  'Good evening, guvnah.',
  'My name is inigo montoya. You killed my father. Prepare to die.'
]

get '/' do
  'server is up'
end

get '/greeting' do
  redis.incr('ohai')
  GREETS.sample
end

get '/count' do
  count = redis.get('ohai')
  "#{count || 0} greetings have been made"
end

