require_relative 'base'

module Collection
  class Message < Base

    ID = 'messages'
    GEN_ID = []
    ALLOWED_ATTRS = [:timestamp, :sender, :body]
    VISIBLE_ATTRS = [:timestamp, :sender, :body]

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

    def collection_id
      super ID
    end

  end
end