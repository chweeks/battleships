require 'board'

describe Board do

  it { is_expected.to respond_to(:place).with(3).arguments }

  it 'Board is a grid' do
    expect(subject.grid.is_a?(Array)).to eq(true)
  end

  describe '#place'do
    it 'places ship in correct grid position when orientation north' do
      ship = double(:ship, size: 3)
      subject.place(ship, [2,0], "north")
      expect(subject.grid[2][0]).to eq(ship)
      expect(subject.grid[1][0]).to eq(ship)
      expect(subject.grid[0][0]).to eq(ship)
    end
  end

end
