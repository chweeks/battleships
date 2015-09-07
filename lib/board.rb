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

  def overlap?(x,y)
  	grid[x][y] != 0
  end

  def array_xy(x,y)
    xy = []
    xy << x
    xy << y
    xy
  end

  def place(ship, location, orientation)
    x, y = location[0], location[1]
    co_ords = []
    ship.size.times do
      fail 'outside' if outside?(x,y)
      fail 'overlap' if overlap?(x,y)
      case orientation
        when 'north'
          xy = array_xy(x,y)
          x -= 1
        when 'south'
          xy = array_xy(x,y)
          x += 1
        when 'east'
          xy = array_xy(x,y)
          y += 1
        when 'west'
          xy = array_xy(x,y)
          y -= 1
      end
      co_ords << xy
    end
    co_ords.each{|co_ord| grid[co_ord[0]][co_ord[1]] = ship}
  end
end
