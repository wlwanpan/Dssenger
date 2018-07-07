require_relative 'base'

module Collection
  class User < Base

    _ID = 'users'
    GEN_ID = [:name, :password_hash]
    ALLOWED_ATTRS = [:name, :email, :password_hash, :contactList, :conversationList, :avatar]
    VISIBLE_ATTRS = [:name, :avatar]

    attr_reader :_ID, :GEN_ID, :ALLOWED_ATTRS, :VISIBLE_ATTRS


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