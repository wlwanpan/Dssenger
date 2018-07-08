require 'sinatra'
require 'sinatra/cross_origin'
require 'rack/cors'
require 'json'

require_relative './controller'
require_relative './helpers/math'

class Connection < Sinatra::Base
  include Math

  set reload_templates: false

  set :bind, '0.0.0.0'

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

    @_controller = Controller.new
    @_connections = []

  end

  get '/' do
    200
  end

  get '/user/:id' do |id|
    user_exist = @_controller.record_exist? 'user', id
    {exist: user_exist}.to_json
  end

  post '/register' do
    # User attributes: name, email, password(bytes32), avatar(base64)
    password_hash = sha256 params[:password]
    @_controller.create_record('user', {
        name: params[:name], email: params[:email], password_hash: password_hash, contactList: [], avatar: params[:avatar]
      })
  end

  post '/login' do
    password_hash = sha256 params[:password]
    output = @_controller.login password_hash, params[:name]
    puts output
    output
  end

  get '/users' do
    @_controller.load_users
    # Gonna keep fake data till ui is complete
    [{name: 'Elvin'}, {name: 'Neil'}].to_json
  end

  get '/user/:id/contacts' do |id|
    @_controller.load_contacts id
  end

  get '/user/:id/conversations' do |id|
    @_controller.load_conversations id
  end

  post '/users/conversations/:id' do |id|
    @_controller.load_messages id
  end

  get '/stream', provides: 'text/event-stream' do
    # Might use this one instead of stream
    # https://github.com/gruis/sinatra-websocket
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