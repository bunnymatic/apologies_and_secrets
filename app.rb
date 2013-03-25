require 'sinatra'
require 'sinatra/partial'

class ApologiesAndSecrets < Sinatra::Base
  set :environment, ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'production'
  set :logging, true
  set :root, Dir.pwd

  register Sinatra::Partial
  set :partial_template_engine, :erb

  APP_ROOT = root

  get '/' do
    erb :index
  end

  get '/apologies' do
    @apologies = Apology.all
    erb :apologies
  end

  get '/secrets' do
    @secrets = Secret.all
    erb :secrets
  end


  run! if app_file == $0
end

Dir[File.join(File.dirname(__FILE__),"models/**/*.rb")].each do |file|
  require file
end
