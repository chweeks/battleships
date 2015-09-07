require 'board'

describe Board do

  it { is_expected.to respond_to(:place).with(3).arguments }

  it { is_expected.to respond_to(:show) }

  it { is_expected.to respond_to(:fire) }

  it 'Board is a grid' do
    expect(subject.grid.is_a?(Array)).to eq(true)
  end

  describe '#place'do

    it 'places ship in correct grid position when orientation north' do
      ship = 2
      subject.place(ship, [2,0], "north")
      expect(subject.grid[2][0]).to eq('S')
      expect(subject.grid[1][0]).to eq('S')
    end

    it 'places ship in correct grid position when orientation south' do
      ship = 2
      subject.place(ship, [0,0], "south")
      expect(subject.grid[0][0]).to eq('S')
      expect(subject.grid[1][0]).to eq('S')
    end

    it 'places ship in correct grid position when orientation east' do
      ship = 2
      subject.place(ship, [0,0], "east")
      expect(subject.grid[0][0]).to eq('S')
      expect(subject.grid[0][1]).to eq('S')
    end

    it 'places ship in correct grid position when orientation west' do
      ship = 2
      subject.place(ship, [0,1], "west")
      expect(subject.grid[0][1]).to eq('S')
      expect(subject.grid[0][0]).to eq('S')
    end

    it 'raise error if asked to place ship out of the board' do
      ship = 11
      expect{subject.place(ship, [0,0], "east")}.to raise_error "outside"
    end

    it 'ship not place when error raised' do
      ship = 11
      expect{subject.place(ship, [0,0], "east")}.to raise_error "outside"
      expect(subject.grid.include? ship).to be false
    end

    it 'raise error when trying to place a ship overlapping another ship' do
      ship1 = 3
      ship2 = 3
      subject.place(ship1,[0,0],"south")
      expect{subject.place(ship2,[1,0],"east")}.to raise_error "overlap"
    end
  end

  describe '#fire' do
    context "When it's a hit" do
      it 'change cell to X' do
        ship = 2
        subject.place(ship, [0,0], "east")
        subject.fire(0,0)
        expect(subject.grid[0][0]).to eql 'X'
      end
    end
    context "When it's a miss" do
      it 'change cell to M' do
        ship = 2
        subject.place(ship, [1,0], "east")
        subject.fire(0,0)
        expect(subject.grid[0][0]).to eql 'M'
      end
    end
  end
end
