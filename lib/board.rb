class Board

  attr_accessor :grid

  def initialize
    @grid = [[0,0,0,0],
    				 [0,0,0,0],
    				 [0,0,0,0],
    				 [0,0,0,0]]
  end

  def place(ship, location, orientation)
    x, y = location[0], location[1]
    ship.size.times do
      case orientation
        when 'north'
          grid[x][y] = ship
          x -= 1
        when 'south'
          grid[x][y] = ship
          x += 1
        when 'east'
          grid[x][y] = ship
          y += 1
        when 'west'
          grid[x][y] = ship
          y -= 1
      end
    end
  end
end
