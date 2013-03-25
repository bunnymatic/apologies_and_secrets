require 'rubygems'
require 'sinatra'

disable :run, :reload

require './app.rb'

run ApologiesAndSecrets.new
