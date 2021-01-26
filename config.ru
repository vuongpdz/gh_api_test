require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/reloader' if development?

Bundler.setup(:default, ENV['RACK_ENV'])
Bundler.require(:default, ENV['RACK_ENV'])

Figaro.application = Figaro::Application.new(
  environment: ENV['RACK_ENV'],
  path: File.expand_path("config/application.yml")
)
Figaro.load

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require './kuruma_robot'

run KurumaRobot
