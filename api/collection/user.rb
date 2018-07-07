require_relative 'base'

module Collection
  class User < Base

    _ID = 'users'
    _GEN_ID = [:name, :password_hash]
    _ALLOWED_ATTRS = [:name, :email, :password_hash, :contactList, :avatar]

    attr_reader :_ID, :_GEN_ID, :_ALLOWED_ATTRS

  end
end