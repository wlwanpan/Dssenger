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
    password_hash = sha256 'wawawawa'
    @_controller.create_record('user', {
        username: 'wawawawa', email: 'neil@gmail.com', password_hash: password_hash, contactList: [], avatar: ''
      })
  end

  get '/user/:id' do |id|
    user_exist = @_controller.record_exist? 'user', id
    {exist: user_exist}.to_json
  end

  post '/register' do
    # User attributes: name, email, password(bytes32), avatar(base64)
    password_hash = sha256 params[:password]
    @_controller.create_record('user', {
        username: params[:username], email: params[:email], password_hash: password_hash, contactList: [], avatar: params[:avatar]
      })
  end

  post '/login' do
    read_req = eval(request.body.read)
    return 200 if read_req[:password].nil? or read_req[:username].nil?
    password_hash = sha256 read_req[:password]
    @_controller.login read_req[:username], password_hash
  end

  get '/users' do
    @_controller.load_users
    # Gonna keep fake data till ui is complete
    [{username: 'Elvin'}, {username: 'Neil'}].to_json
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
    204
  end

end

Connection.run!