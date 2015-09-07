class Board

  attr_accessor :grid

  def initialize
    @grid = [[0,0,0,0],
    				 [0,0,0,0],
    				 [0,0,0,0],
    				 [0,0,0,0]]
  end

  def outside?(x,y)
  	x < 0 || y < 0 || x >= grid.size || y >= grid[0].size
  end

  def place(ship, location, orientation)
    x, y = location[0], location[1]
    ship.size.times do

    	fail 'outside' if outside?(x,y)
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

# require_relative 'ship'
# ship1 = Ship.new
# board1= Board.new
# board1.place(ship1,[0,0],'north')
# p board1.grid