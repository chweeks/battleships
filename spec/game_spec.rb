require 'game'

describe Game do

  it 'creates player_1' do
    game = Game.new
    expect(game.player_1).to be_kind_of Player
  end

  it 'creates player_2' do
    game = Game.new
    expect(game.player_2).to be_kind_of Player
  end

  describe '#initialize' do

    it { is_expected.to respond_to :grid_size }

    it 'created with default grid size' do
      expect(subject.grid_size).to be 10
    end

    it 'can set custom grid size' do
      game = Game.new(13)
      expect(game.grid_size).to be 13
    end
  end

end
