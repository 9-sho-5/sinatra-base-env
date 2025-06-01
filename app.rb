require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

set :root, File.expand_path(__dir__) # app.rb のあるディレクトリをrootに指定
set :views, File.join(settings.root, 'views')

set :bind, '0.0.0.0'
set :port, 4567

get '/' do
 erb :index
end
