require 'player'

describe Player do

  let(:boat) { double :boat, boat_position: [[0,0],[0,1]], destroyed?: false }
  let(:sunk_boat) { double :boat, boat_position: [[2,0],[2,1]], destroyed?: true }

  subject(:player) { Player.new('Player 1') }

  it { is_expected.to respond_to(:harbour) }

  describe '#add_boat' do

    it { is_expected.to respond_to(:add_boat).with(1).arguments }

    it 'adds boat to players harbour array' do
      player.add_boat(boat)
      expect(player.harbour.include? boat).to be true
    end

    it 'raises error if ships overlap' do
      player.add_boat(boat)
      expect{player.add_boat(boat)}.to raise_error 'ship overlapping'
    end

  end

  describe '#fire' do

    it { is_expected.to respond_to(:fire).with(2).arguments }

    it 'hits boat if coords match' do
      player.add_boat(boat)
      player.fire(player, [0,0])
      expect(boat.boat_position).to eql([[0,1]])
    end

  end

  describe '#hit' do

    it { is_expected.to respond_to(:hit) }

    it 'should add coordinates to hit array' do
      player.add_boat(boat)
      player.fire(player, [0,0])
      expect(player.hits.include?([0,0])).to be true
    end

    it 'boat removed from harbour on final hit' do
      player.add_boat(sunk_boat)
      expect(player.harbour.include?(boat)).to be false
    end

  end

  describe '#miss' do

    it { is_expected.to respond_to(:miss) }

    it 'should add coordinates to miss array' do
      player.add_boat(boat)
      player.fire(player, [0,2])
      expect(player.misses.include?([0,2])).to be true
    end

    it 'only adds coordinates that don\'t already exist' do
      allow(player).to receive(:harbour).and_return([boat])
      2.times{ player.fire(player,[0,2]) }
      expect(player.misses.length).to be 1
    end


  end

  describe '#is_loser?' do

    it { is_expected.to respond_to(:loser?) }

    it 'should report that the player has lost when harbour is empty' do
      expect(player).to be_loser
    end

  end

end
