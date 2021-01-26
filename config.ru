require 'sinatra'
require 'sinatra/reloader' if development?
require 'octokit'

class KurumaRobot < Sinatra::Base
  post '/update_master_data' do
    token = '<token>'
    client = Octokit::Client.new(:access_token => token)
    client.readme 'vuongpdz/gh_api_test', :accept => 'application/vnd.github.html'
  end
end

run KurumaRobot
