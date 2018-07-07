require_relative 'base'

module Collection
  class Conversation < Base

    _ID = 'conversations'
    _GEN_ID = []
    _ALLOWED_ATTRS = []

    attr_reader :_ID, :_GEN_ID, :_ALLOWED_ATTRS

  end
end