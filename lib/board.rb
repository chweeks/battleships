class Board

  attr_accessor :grid

  def initialize
    @grid = [[0,0,0,0],
    				 [0,0,0,0],
    				 [0,0,0,0],
    				 [0,0,0,0]]
  end

  def place(ship, location)
		grid[location[0]][location[1]] = ship   	
  end

end
