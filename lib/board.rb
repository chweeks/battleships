class Board

  attr_accessor :grid

  def initialize
    @grid = []
    10.times{@grid << ['O','O','O','O','O','O','O','O','O','O']}
  end

  def show
  	grid.each{|row| p row}
    nil
  end

  def place(ship, location, orientation)
    x, y = location[0], location[1]
    co_ords = []
    ship.times do
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
    co_ords.each{|co_ord| grid[co_ord[0]][co_ord[1]] = 'S'}
  end

  def fire(x,y)
    if grid[x][y] == 'O'
      grid[x][y] = 'M'
    elsif grid[x][y] == 'S'
      grid[x][y] = 'X'
    end
  end

  private

    def outside?(x,y)
    	x < 0 || y < 0 || x >= grid.size || y >= grid[0].size
    end

    def overlap?(x,y)
    	grid[x][y] != 'O'
    end

    def array_xy(x,y)
      xy = []
      xy << x
      xy << y
      xy
    end
end

board1 = Board.new
board2 = Board.new
board2.place(6,[0,0],'east')
board2.fire(0,0)
board2.fire(1,0)
board1.fire(1,0)
board2.show






