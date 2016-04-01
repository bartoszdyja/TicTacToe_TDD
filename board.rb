class Board
  attr_reader :grid, :success

  def initialize
    @grid = Array.new(9,'_')
  end

  def draw
    n=0
    3.times do
      p "#{grid[n]}|#{grid[n+1]}|#{grid[n+2]}"
      n+=3
    end
  end

  def success?(player)
      patterns=[
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
      ]
      patterns.any? do |pattern|
        pattern.all? {|val| grid[val]==player.shape}
      end
  end

  def update(n, shape)
    n -= 1
    grid[n]=='_' ? grid[n] = shape : false
  end

  def full?
    grid.include? ('_')
  end
end
