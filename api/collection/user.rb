require_relative 'base'

module Collection
  class User < Base

    GEN_ID = [:username, :password_hash]
    ALLOWED_ATTRS = [:username, :email, :contactList, :conversationList, :avatar, :password_hash]
    VISIBLE_ATTRS = [:username, :avatar]

    def load_collection record_ids
      super record_ids, VISIBLE_ATTRS
    end

    def generate_record_id options
      super options, GEN_ID
    end

    def create_record options
      super options, GEN_ID
    end

    def load_contacts user_id
      current_user = find_record_by_id user_id, [:contactList]
      contact_ids = current_user[:contractList]

      return [].to_json if contact_ids.nil? || contact_ids.empty?
      contact_list = load_collection contact_ids
      contact_list.to_json
    end

    def load_conversations user_id
      current_user = find_record_by_id user_id, [:conversationList]
      conversation_ids = current_user[:conversationList]

      conversation_list = load_collection conversation_ids
      conversation_list.to_json
    end

    def create_record_params attrs
      super attrs, ALLOWED_ATTRS
    end

  end
end