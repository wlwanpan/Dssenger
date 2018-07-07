
# not sure gonna need this one
module Math

  def sha256 str
    Digest::SHA2.hexdigest str
  end

  # Might need later on
  # def max_int
  #   bytes = [''].pack('p').size
  #   bits = bytes * 8
  #   max_unsigned = 2**bits - 1
  #   max_unsigned
  # end
  #
  # def generate_rand_i
  #   rand_str = Time.now.to_s + rand(max_int)
  #   hashed_str = sha256 rand_str
  #   hashed_str
  # end

end