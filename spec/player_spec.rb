require 'player'

describe Player do

  let(:boat) { double :boat, boat_position: [[0,0],[0,1]], destroyed?: false }
  let(:sunk_boat) { double :boat, boat_position: [[2,0],[2,1]], destroyed?: true }

  it { is_expected.to respond_to(:harbor) }

  describe '#add_boat' do

    it { is_expected.to respond_to(:add_boat).with(1).arguments }

    it 'adds boat to players harbor array' do
      subject.add_boat(boat)
      expect(subject.harbor.include? boat).to be true
    end

    it 'raises error if ships overlap' do
      subject.add_boat(boat)
      expect{subject.add_boat(boat)}.to raise_error 'ship overlapping'
    end

  end

  describe '#fire' do

    it { is_expected.to respond_to(:fire).with(2).arguments }

    it 'hits boat if coords match' do
      subject.add_boat(boat)
      subject.fire(subject, [0,0])
      expect(boat.boat_position).to eql([[0,1]])
    end

  end

  describe '#hit' do

    it { is_expected.to respond_to(:hit) }

    it 'should add coordinates to hit array' do
      subject.add_boat(boat)
      subject.fire(subject, [0,0])
      expect(subject.hits.include?([0,0])).to be true
    end

    it 'boat removed from harbor on final hit' do
      subject.add_boat(sunk_boat)
      expect(subject.harbor.include?(boat)).to be false
    end

  end

  describe '#miss' do

    it { is_expected.to respond_to(:miss) }

    it 'should add coordinates to miss array' do
      subject.add_boat(boat)
      subject.fire(subject, [0,2])
      expect(subject.misses.include?([0,2])).to be true
    end

  end

  describe '#is_loser?' do

    it { is_expected.to respond_to(:loser?) }

    it 'should report that the player has lost when harbour is empty' do
      expect(subject).to be_loser
    end

  end

end
