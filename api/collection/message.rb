require_relative 'base'

module Collection
  class Message < Base

    _ID = 'messages'
    _GEN_ID = []
    _ALLOWED_ATTRS = []

    attr_reader :_ID, :_GEN_ID, :_ALLOWED_ATTRS

  end
end