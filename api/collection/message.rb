require_relative 'base'

module Collection
  class Message < Base

    GEN_ID = [:created_at, :sender_id]
    ALLOWED_ATTRS = [:created_at, :sender_id, :body]
    VISIBLE_ATTRS = [:created_at, :sender_id, :body]

    def load_collection record_ids
      super record_ids, VISIBLE_ATTRS
    end

    def generate_record_id options
      super options, GEN_ID
    end

    def create_record options
      super options, GEN_ID
    end

    def create_record_params attrs
      super attrs, ALLOWED_ATTRS
    end

  end
end