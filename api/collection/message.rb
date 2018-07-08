require_relative 'base'

module Collection
  class Message < Base

    ID = 'messages'
    GEN_ID = []
    ALLOWED_ATTRS = [:timestamp, :sender, :body]
    VISIBLE_ATTRS = [:timestamp, :sender, :body]

    def generate_record_id options
      base_generate_record_id options, GEN_ID
    end

    def create_record options
      base_create_record attrs, GEN_ID
    end

  end
end