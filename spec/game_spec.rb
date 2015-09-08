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

end
