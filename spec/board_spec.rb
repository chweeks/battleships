require 'board'

describe Board do

  it { is_expected.to respond_to(:place).with(3).arguments }

  it 'Board is a grid' do
    expect(subject.grid.is_a?(Array)).to eq(true)
  end

  describe '#place'do

    it 'places ship in correct grid position when orientation north' do
      ship = double :ship, size: 2
      subject.place(ship, [2,0], "north")
      expect(subject.grid[2][0]).to eq(ship)
      expect(subject.grid[1][0]).to eq(ship)
    end

    it 'places ship in correct grid position when orientation south' do
      ship = double :ship, size: 2
      subject.place(ship, [0,0], "south")
      expect(subject.grid[0][0]).to eq(ship)
      expect(subject.grid[1][0]).to eq(ship)
    end

    it 'places ship in correct grid position when orientation east' do
      ship = double :ship, size: 2
      subject.place(ship, [0,0], "east")
      expect(subject.grid[0][0]).to eq(ship)
      expect(subject.grid[0][1]).to eq(ship)
    end

    it 'places ship in correct grid position when orientation west' do
      ship = double :ship, size: 2
      subject.place(ship, [0,1], "west")
      expect(subject.grid[0][1]).to eq(ship)
      expect(subject.grid[0][0]).to eq(ship)
    end

    it 'raise error if asked to place ship out of the board' do
      ship = double :ship, size: 5
      expect{subject.place(ship, [0,0], "east")}.to raise_error "outside"
      expect(subject.grid.include? ship).to be false
    end
  end
end
