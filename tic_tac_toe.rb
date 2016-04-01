require './board'
require './player'

class Game
  attr_reader :board
  attr_accessor :current_player, :player, :opponent

  def initialize
    @board = Board.new
    shape1, shape2 = %w(X O).shuffle
    @player = Player.new(shape1)
    @opponent = Player.new(shape2)
    @current_player = [@player, @opponent].sample
  end

  def self.welcome_message
    puts 'Welcome to the game'
    puts 'Play against computer'
    puts 'What\'s your name'
  end

  def make_move(current_player)
    if current_player == player
      puts 'Where do you want to put your '+ current_player.shape + ', ' + current_player.name
      position = gets.chomp.to_i
    else
      puts 'Computer\'s move'
      position = rand(9)
    end
    unless board.update(position, current_player.shape)
      puts 'This move is not permitted. Try again'
      make_move(current_player)
    end
  end

  def switch_user
    if current_player == player
      self.current_player = opponent
    else
      self.current_player = player
    end
  end

  def game_over?
    if board.success?(current_player)
      puts "#{current_player.name} won!"
      return true
    end
    unless board.full?
      puts 'It\'s a tie'
      return true
    end
  end

  def run
    Game.welcome_message
    name = gets.chomp
    player.name = name
    puts "#{current_player.name} goes first..."
    board.draw
    loop do
      make_move(current_player)
      board.draw
      break if game_over?
      switch_user
    end
  end
end

@game = Game.new
@game.run
