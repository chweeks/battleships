require 'board'

describe Board do

  it { is_expected.to respond_to :place }

  it 'Board is a grid' do
    expect(subject.instance_variable_get(:@grid).class).to eql Array
  end

  describe '#place'do
    it 'places ship in correct grid position' do
      ship = :ship
      subject.place(ship, location)
    end
  end

end
