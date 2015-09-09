class Boat

  attr_accessor :boat_position

  def initialize(size, y, x, orientation)
    @boat_position = []
    size.times do
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
