require 'sinatra'
require 'sinatra/cross_origin'
require 'json'
require_relative './bluzelle'

class Connection < Sinatra::Base

  set reload_templates: false

  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  def initialize

    @_db = Bluzelle.new
    @_connections = []

  end

  get '/' do
    200
  end

  # user collection routes

  get '/users' do
    [{name: 'Elvin'}, {name: 'Neil'}].to_json
  end

  get '/user/register' do
    puts 'user register'
  end

  get '/user/login' do
    # Login
    puts 'user login'
  end

  get '/user/:id/contacts' do |user_id|
    # Get contacts
    puts 'list of contacts'
  end

  get '/user/:id/conversations' do |user_id|
    # Get conversation
    puts 'list of conversations'
  end

  post '/user/:user_id/conversations/:id' do |user_id, conversation_id|
    #
    puts 'conversation id'
  end

  get '/stream', provides: 'text/event-stream' do
    # stream :keep_open do |out|
    #   @_connections << out
    #   out.callback { @_connections.delete(out) }
    # end
  end

  post '/' do
    # @_connections.each { |out| out << "#{out}: #{params[:msg]}" }
    puts 'Post params from here'
    204
  end

end

Connection.run!