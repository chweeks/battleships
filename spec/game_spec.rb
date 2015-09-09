require 'game'

describe Game do

  it 'creates player_1' do
    expect(subject.player_1).to be_kind_of Player
  end

  it 'creates player_2' do
    expect(subject.player_2).to be_kind_of Player
  end

  describe '#out_of_bounds?' do

    it { is_expected.to respond_to :out_of_bounds? }

    it 'raises error when boat is out of bounds' do
      game = Game.new(2)
      boat = double :boat, boat_position: [[0,1], [0,2], [0,3]]
      expect { game.out_of_bounds?(boat) }.to raise_error 'ship out of bounds'
    end
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
