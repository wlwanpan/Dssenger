require 'swarmclient'
require_relative './model/user'
require_relative './model/conversation'
require_relative './model/message'

class Bluzelle

  include Model::User
  include Model::Conversation
  include Model::Message

  ENDPOINT = 'testnet-dev.bluzelle.com'
  PORT = 51010
  UUID = '9cec813e-8191-11e8-adc0-fa7ae01bbebc'

  def initialize
    @_bluzelle = Swarmclient::Communication.new endpoint: ENDPOINT, port: PORT, uuid: UUID
  end

  def user_exist
  end

end