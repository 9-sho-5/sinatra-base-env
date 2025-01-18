require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

set :bind, '0.0.0.0'

get '/' do
 "Hello, world!"
end
