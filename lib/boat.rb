class Boat

  attr_accessor :boat_position

  def initialize(size, x, y, orientation)
    @boat_position = []
    size.times do
      boat_position << [x,y]
      case orientation
        when 'north'
          y += 1
        when 'south'
          y -= 1
        when 'east'
          x += 1
        when 'west'
          x -= 1
      end
    end
  end

  def destroyed?
    boat_position.empty?
  end
end
