class Boat

  attr_accessor :boat_position

  def initialize(size, x, y, orientation)
    @boat_position = []
    size.times do
      boat_position << [x,y]
      y += 1 if orientation.downcase == 'north'
      y -= 1 if orientation.downcase == 'south'
      x += 1 if orientation.downcase == 'east'
      x -= 1 if orientation.downcase == 'west'
    end
  end

  def destroyed?
    boat_position.empty?
  end
end
