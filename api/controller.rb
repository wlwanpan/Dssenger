require 'swarmclient'
require 'json'

require_relative './collection/user'
require_relative './collection/conversation'
require_relative './collection/message'

class Controller

  ENDPOINT = 'testnet-dev.bluzelle.com'
  PORT = 51010
  UUID = "d70d748f-9215-4a17-880b-a4576fe9c445" # 'b1b8339c-46c1-4cca-9d32-22a03c59e27a' # OLD -> '9cec813e-8191-11e8-adc0-fa7ae01bbebc' # Fixed for now

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
    users = eval @_bluzelle.read 'users'
    output =
      users.each map do |user_id|
        begin
          eval @_bluzelle.read user_id
        rescue
          nil
        end
      end

    output.compact.to_json
  end

  def load_contacts user_id
    contacts = @_user_collection.load_contacts user_id
    contacts.to_json
  end

  def add_contact user_id, contact_id
    current_user = eval @_bluzelle.read(user_id).gsub(/\\u200c/, '')
    current_user[:contactList] << contact_id
    @_bluzelle.update user_id, current_user.to_json

    contact_user = eval @_bluzelle.read(contact_id).gsub(/\\u200c/, '')
    contact_user[:contactList] << user_id
    @_bluzelle.update contact_id, contact_user.to_json

    200
  end

  def load_messages user_id, participant_id
    bluzelle_keys = @_bluzelle.keys
    generated_conversation_id1 = Digest::SHA2.hexdigest(user_id + participant_id).to_s
    generated_conversation_id2 = Digest::SHA2.hexdigest(participant_id + user_id).to_s

    generated_conversation_id =
      if bluzelle_keys.include?(generated_conversation_id1) then generated_conversation_id1
      else generated_conversation_id2
      end

    return [].to_json unless bluzelle_keys.include?(generated_conversation_id) # no conversation ongoing

    current_conversation = eval @_bluzelle.read(generated_conversation_id)

    messages =
      current_conversation[:messageList].map do |message_id|
        begin
          eval @_bluzelle.read(message_id)
        rescue
          nil
        end
      end

    messages.compact.to_json
  end

  def post_message user_id, participant_id, message
    bluzelle_keys = @_bluzelle.keys
    generated_conversation_id1 = Digest::SHA2.hexdigest(user_id + participant_id).to_s
    generated_conversation_id2 = Digest::SHA2.hexdigest(participant_id + user_id).to_s

    generated_conversation_id =
      if bluzelle_keys.include? generated_conversation_id1 then generated_conversation_id1
      else generated_conversation_id2
      end

    generated_message_id = SecureRandom.uuid.to_s

    # Message attributes
    # [:created_at, :sender_id, :body, :receiver_id]
    new_message = {
      created_at: Time.now,
      sender_id: user_id,
      receiver_id: participant_id,
      body: message
    }
    @_bluzelle.create generated_message_id, new_message.to_json # created new message

    if bluzelle_keys.include? generated_conversation_id
      # conversation exist
      current_conversation = eval @_bluzelle.read(generated_conversation_id)
      current_conversation[:messageList] << generated_message_id
      @_bluzelle.update generated_conversation_id, current_conversation.to_json
    else
      # conversation new: -> attributes
      # [:created_at, :created_by, :participant_id, :messageList]
      new_conversation = {
        created_at: Time.now,
        created_by: user_id,
        participant_id: participant_id,
        messageList: [generated_message_id]
      }
      @_bluzelle.create generated_conversation_id, new_conversation.to_json
    end

    200
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