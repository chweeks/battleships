require 'game'

describe Game do

  subject(:game) { Game.new }

  it 'creates player_1' do
    expect(game.player_1).to be_kind_of Player
  end

  it 'creates player_2' do
    expect(game.player_2).to be_kind_of Player
  end

  describe '#out_of_bounds?' do

    it { is_expected.to respond_to :out_of_bounds? }

    it 'raises error when boat is out of bounds' do
      game2 = Game.new(2)
      boat = double :boat, boat_position: ['A1', 'A2', 'A11']
      expect { game2.out_of_bounds?(boat) }.to raise_error 'ship out of bounds'
    end
  end

  describe '#initialize' do

    it { is_expected.to respond_to :grid_size }

    it 'created with default grid size' do
      expect(game.grid_size).to be 10
    end

    it 'can set custom grid size' do
      game13 = Game.new(13)
      expect(game13.grid_size).to be 13
    end
  end
end
