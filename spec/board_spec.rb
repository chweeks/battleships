require 'board'

describe Board do

  it { is_expected.to respond_to :place }

  it 'Board is a grid' do
    #expect(subject.instance_variable_get(:@grid).class).to eql Array
    expect(subject.grid.is_a?(Array)).to eq(true)
  end

  describe '#place'do
    it 'places ship in correct grid position' do
      ship = double(:ship)
      subject.place(ship, [0,0])
      expect(subject.grid[0][0]).to eq(ship)
    end
  end

end
