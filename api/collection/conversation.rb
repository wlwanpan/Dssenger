require_relative 'base'

module Collection
  class Conversation < Base

    GEN_ID = [:created_by, :participant_id]
    ALLOWED_ATTRS = [:created_at, :created_by, :participant_id, :messageList]
    VISIBLE_ATTRS = [:created_at, :created_by, :participant_id, :messageList]

    def load_collection record_ids
      super record_ids, VISIBLE_ATTRS
    end

    def generate_record_id options
      super options, GEN_ID
    end

    def create_record options
      super options, GEN_ID
    end

    def load_messages user_id, participant_id
      conversation_id = generate_record_id create_by: user_id, participant_id: participant_id

      current_conversation = find_record_by_id conversation_id, [:messageList]

      return [] unless current_conversation[:error].nil?
      message_ids = current_conversation[:messageList]
      return [] if message_ids.nil? || message_ids.empty?
      load_collection message_ids
    end

    def post_message
    end

    def create_record_params attrs
      super attrs, ALLOWED_ATTRS
    end

  end
end