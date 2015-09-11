require 'boat'

describe Boat do

  it 'should initialize size, coordinates and orientation' do
    expect(Boat).to respond_to(:new).with(3).arguments
  end

  it 'Creates ship with correct size and coordinates' do
    boat = Boat.new(3, 'A1', 'south')
    expect(boat.boat_position).to eql ['A1','A2','A3']
  end

  it 'informs player when boat has been destroyed' do
    boat = Boat.new(1, 'A1', 'south')
    boat.boat_position.delete('A1')
    expect(boat.destroyed?).to be true
  end
end
