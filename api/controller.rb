require 'swarmclient'
require 'json'

require_relative './collection/user'
require_relative './collection/conversation'
require_relative './collection/message'

class Controller

  ENDPOINT = 'testnet-dev.bluzelle.com'
  PORT = 51010
  UUID = '9cec813e-8191-11e8-adc0-fa7ae01bbebc' # Fixed for now

  def initialize

    @_bluzelle = Swarmclient::Communication.new endpoint: ENDPOINT, port: PORT, uuid: UUID

    @_user_collection = Collection::User.new bluzelle: @_bluzelle
    @_conversation_collection = Collection::Conversation.new bluzelle: @_bluzelle
    @_message_collection = Collection::Message.new bluzelle: @_bluzelle

    init_collection
  end

  def record_exist? record_type, record_id
    collection = current_collection record_type
    collection.record_exist? record_id
  end

  def create_record record_type, record_attrs
    collection = current_collection record_type
    collection.create_record record_attrs
  end

  def login name, password
    collection = current_collection 'user'
    user_id = collection.generate_record_id name: name, password_hash: password_hash
    collection.find_record_by_id user_id
  end

private

  def init_collection
    bluzelle_keys = @_bluzelle.keys

    # collection_id: []
    ['users', 'conversations', 'messages'].each do |collection_id|
      next if bluzelle_keys.include? collection_id

      @_bluzelle.create collection_id.to_s, [].to_json.to_s
    end
  end

  def current_collection record_type
    case record_type
      when 'user' then @_user_collection
      when 'conversation' then @_conversation_collection
      when 'message' then @_message_collection
    end
  end

end