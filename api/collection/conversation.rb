require_relative 'base'

module Collection
  class Conversation < Base

    GEN_ID = []
    ALLOWED_ATTRS = [:created_at, :created_by, :participantList, :messageList]
    VISIBLE_ATTRS = [:created_at, :created_by, :participantList, :messageList]

    def load_collection record_ids
      super record_ids, VISIBLE_ATTRS
    end

    def generate_record_id options
      super options, GEN_ID
    end

    def create_record options
      super options, GEN_ID
    end

    def load_messages conversation_id
      current_conversation = find_record_by_id conversation_id, [:messageList]
      message_ids = current_conversation[:messageList]

      message_list = load_collection message_ids

      message_list.to_json
    end

    def create_record_params attrs
      super attrs, ALLOWED_ATTRS
    end

  end
end