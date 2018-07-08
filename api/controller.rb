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

    @_user_collection = Collection::User.new bluzelle: @_bluzelle, collection_key: 'users'
    @_conversation_collection = Collection::Conversation.new bluzelle: @_bluzelle, collection_key: 'conversations'
    @_message_collection = Collection::Message.new bluzelle: @_bluzelle, collection_key: 'messages'

    init_collection
  end

  def record_exist? record_type, record_id
    collection = current_collection record_type
    collection.record_exist? record_id
  end

  def create_record record_type, record_attrs
    collection = current_collection record_type
    new_record = collection.create_record record_attrs
    new_record.to_json
  end

  # User specific
  def login username, password_hash
    collection = current_collection 'user'
    user_id = collection.generate_record_id username: username, password_hash: password_hash
    user_record = collection.find_record_by_id user_id, [:username, :avatar]
    user_record.to_json
  end

  def load_users
    users = @_user_collection.load_collection []
    users.to_json
  end

  def load_contacts user_id
    contacts = @_user_collection.load_contacts user_id
    contacts.to_json
  end

  def add_contact user_id, contact_id
    result = @_user_collection.add_contact user_id, contact_id
    if result == true
      {status: true}
    else
      result.to_json
    end
  end

  def create_conversation user_id, participant_id
    # [:created_at, :created_by, :participant_id, :messageList]
    attrs = { created_at: Time.now, created_by: user_id, participant_id: participant_id, messageList: [] }
    new_conversation = @_conversation_collection.create_record attrs
    new_conversation
  end

  def load_messages user_id, participant_id
    messages = @_conversation_collection.load_messages user_id, participant_id
    messages.to_json
  end

  def post_message user_id, participant_id, message
    # [:created_at, :sender_id, :body]
    attrs = { created_at: Time.now, sender_id: user_id, body: message }
    new_message = @_message_collection.create_record attrs

    conversation_id = @_conversation_collection.generate_record_id created_by: user_id, participant_id: participant_id

    unless @_conversation_collection.record_exist? conversation_id
      new_conversation = create_conversation user_id, participant_id
    end
    @_conversation_collection.append_to new_conversation[:_id], 'messageList', new_message[:_id]

  end

private

  def init_collection
    bluzelle_keys = @_bluzelle.keys
    ['users', 'conversations', 'messages'].each do |collection_id|
      next if bluzelle_keys.include? collection_id

      @_bluzelle.create collection_id.to_s, [].to_json
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