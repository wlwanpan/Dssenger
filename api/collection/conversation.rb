require_relative 'base'

module Collection
  class Conversation < Base

    ID = 'conversations'
    GEN_ID = []
    ALLOWED_ATTRS = [:participantList, :messageList]
    VISIBLE_ATTRS = [:participantList, :messageList]

    def generate_record_id options
      base_generate_record_id options, GEN_ID
    end

    def create_record options
      base_create_record attrs, GEN_ID
    end

    def collection_id
      ID.to_s
    end

    def load_messages conversation_id
      current_conversation = find_record_by_id conversation_id, [:messageList]
      message_ids = current_conversation[:messageList]

      message_list = load_collection message_ids

      message_list.to_json
    end

  end
end