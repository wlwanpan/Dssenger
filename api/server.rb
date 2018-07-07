require 'sinatra'
require_relative './bluzelle'

class Connection < Sinatra::Base

  def initialize

    @_db = Bluzelle.new
    @_connections = []

  end

  get '/' do
    puts 'ok'
  end

  get '/register' do
  end

  get '/login' do
  end

  get '/stream', provides: 'text/event-stream' do
    stream :keep_open do |out|
      @_connections << out
      out.callback { @_connections.delete(out) }
    end
  end

  post '/' do
    @_connections.each { |out| out << "#{out}: #{params[:msg]}" }
    p 'Post params from here'
    204
  end

end

Connection.run!