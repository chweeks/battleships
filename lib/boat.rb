class Boat

  attr_accessor :boat_position

  def initialize(size, y, x, orientation)
    @boat_position = []
    size.times do
      fail 'ship out of bounds' if x > 9 || x < 0 || y > 9 || y < 0
      fail 'ship out of bounds' if x > 2 || x < 0 || y > 2 || y < 0
      boat_position << [y,x]
      case orientation
        when 'north'
          y -= 1
        when 'south'
          y += 1
        when 'east'
          x += 1
        when 'west'
          x -= 1
      end
    end
  end

  def destroyed?
    self.boat_position.empty?
  end
end
