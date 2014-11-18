class Player
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def to_s
    p @token
  end
end
