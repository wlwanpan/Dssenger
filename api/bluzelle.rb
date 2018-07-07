require 'swarmclient'
require_relative './collection/user'
require_relative './collection/conversation'
require_relative './collection/message'

class Bluzelle

  include Collection::User
  include Collection::Conversation
  include Collection::Message

  ENDPOINT = 'testnet-dev.bluzelle.com'
  PORT = 51010
  UUID = '9cec813e-8191-11e8-adc0-fa7ae01bbebc' # Fixed for now

  def initialize
    @_bluzelle = Swarmclient::Communication.new endpoint: ENDPOINT, port: PORT, uuid: UUID
  end

  def user_exist
  end

end