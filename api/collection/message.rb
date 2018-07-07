require_relative 'base'

module Collection
  class Message < Base

    ID = 'messages'
    GEN_ID = []
    ALLOWED_ATTRS = [:timestamp, :sender, :body]
    VISIBLE_ATTRS = [:timestamp, :sender, :body]

    attr_reader :ID, :GEN_ID, :ALLOWED_ATTRS, :VISIBLE_ATTRS

  end
end