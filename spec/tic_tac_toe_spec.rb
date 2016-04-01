require_relative '../tic_tac_toe'

describe Game do
  describe '#new' do
    game = Game.new
    it 'should be true' do
      expect(true).to be_truthy
    end

    it 'should create new board' do
      expect(game.board).to be_a Board
    end

    it 'should create 2 players' do
      expect(game.player).to be_a Player
      expect(game.opponent).to be_a Player
    end

    it 'should assign shapes to players randomly' do
      expect(game.player.shape).to eq('O').or eq('X')
      expect(game.opponent.shape).to eq('O').or eq('X')
    end

    it 'should assign players order' do
      expect(game.current_player).to match(game.player).or match(game.opponent)
    end
  end

  describe '#run' do
    it 'should welcome user' do
      game = Game.new

      expect{ Game.welcome_message }.to output(/Welcome to the game/).to_stdout
    end
  end
end

describe Player do
  player = Player.new('X')
  it 'should have attributes' do
    expect(player).to respond_to(:shape)
  end

  it 'should be assign as Computer by default' do
    expect(player.name).to eq 'Computer'
  end
end

describe Board do
  before :each do
    @board = Board.new
  end
  it { is_expected.to be_a Board }
  it { is_expected.to respond_to :draw }

  it 'assigns coordinates correctly' do
    @board.update(1,'X')
    expect(@board.grid[0]).to eq 'X'
  end

  it 'should create empty draw' do
    expect(@board.grid.size).to eq 9
  end

  it 'should assign \'_\' as default values' do
    expect(@board.grid.all? { |val| val == '_' }).to be_truthy
  end

  it 'should return false if field taken' do
    @board.update(2, 'X')
    expect(@board.update(2, 'O')).to be false
  end

  it 'should update field if possible' do
    expect(@board.update(3, 'X')).to eq 'X'
  end
end
