require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

require_relative './controller'
require_relative './helpers/math'

class Connection < Sinatra::Base
  include Math

  register Sinatra::CrossOrigin

  set reload_templates: false
  set :bind, '0.0.0.0'

  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = "*"
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

  post '/register' do
    decoded_req = request.body.read.gsub(/\\u200c/, '')
    req_params = eval decoded_req
    return {error: 'Missing Parameters'}.to_json if req_params[:password].nil? || req_params[:email].nil? || req_params[:username].nil?
    password_hash = sha256 req_params[:password]
    @_controller.create_record('user', {
        username: req_params[:username], email: req_params[:email], password_hash: password_hash, contactList: [], avatar: ''
      })
  end

  post '/login' do
    req_params = eval request.body.read
    return {error: 'Missing Parameters'}.to_json if req_params[:password].nil? or req_params[:username].nil?
    password_hash = sha256 req_params[:password]
    @_controller.login req_params[:username], password_hash
  end

  get '/user/:id' do |id|
    user_exist = @_controller.record_exist? 'user', id
    {exist: user_exist}.to_json
  end

  get '/users' do
    @_controller.load_users
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

  post 'users/conversations/:id/message' do |id|
    @_controller.post_message id
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
    204
  end

end

Connection.run!