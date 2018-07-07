require_relative 'base'

module Collection
  class Message < Base

    _ID = 'messages'
    GEN_ID = []
    ALLOWED_ATTRS = [:timestamp, :sender, :body]
    VISIBLE_ATTRS = [:timestamp, :sender, :body]

    attr_reader :_ID, :GEN_ID, :ALLOWED_ATTRS, :VISIBLE_ATTRS

  end
end