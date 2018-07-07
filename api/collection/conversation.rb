require_relative 'base'

module Collection
  class Conversation < Base

    _ID = 'conversations'
    GEN_ID = []
    ALLOWED_ATTRS = [:participantList, :messageList]
    VISIBLE_ATTRS = [:participantList, :messageList]

    attr_reader :_ID, :GEN_ID, :ALLOWED_ATTRS, :VISIBLE_ATTRS

    def load_messages conversation_id
      current_conversation = find_record_by_id conversation_id, [:messageList]
      message_ids = current_conversation[:messageList]

      message_list = load_collection message_ids

      message_list.to_json
    end

  end
end