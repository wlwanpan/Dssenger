require_relative 'base'

module Collection
  class User < Base

    ID = 'users'
    GEN_ID = [:username, :password_hash]
    ALLOWED_ATTRS = [:username, :email, :password_hash, :contactList, :conversationList, :avatar]
    VISIBLE_ATTRS = [:username, :avatar]

    def generate_record_id options
      base_generate_record_id options, GEN_ID
    end

    def create_record options
      base_create_record attrs, GEN_ID
    end

    def load_contacts user_id
      current_user = find_record_by_id user_id, [:contactList]
      contact_ids = current_user[:contractList]

      contact_list = load_collection contact_ids
      contact_list.to_json
    end

    def load_conversations user_id
      current_user = find_record_by_id user_id, [:conversationList]
      conversation_ids = current_user[:conversationList]

      conversation_list = load_collection conversation_ids
      conversation_list.to_json
    end

  end
end