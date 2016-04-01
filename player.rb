class Player
  attr_reader :shape
  attr_accessor :name
  def initialize(shape)
    @shape = shape
    @name = 'Computer'
  end

end
