require 'boat'

describe Boat do

  it 'should initialize size, coordinates and orientation' do
    expect(Boat).to respond_to(:new).with(4).argument
  end

  it 'Creates ship with correct size and coordinates' do
    boat = Boat.new(3, 0, 0, 'north')
    expect(boat.boat_position).to eql [[0,0],[1,0],[2,0]]
  end

  it 'informs player when boat has been destroyed' do
    boat = Boat.new(1, 0, 0, 'north')
    boat.boat_position.delete([0, 0])
    expect(boat.destroyed?).to be true
  end
end
