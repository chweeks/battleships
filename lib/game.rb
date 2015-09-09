class Game

  attr_accessor :player_1
  attr_accessor :player_2
  attr_reader :grid_size

  def initialize(grid_size = 10)
    @player_1 = Player.new
    @player_2 = Player.new
    @boat_sizes = [2, 1, 1]
    @grid_size = grid_size
  end

  def create_boats(player)
    @boat_sizes.each do |size|
      puts "Enter y coordinate of large boat"
      y = gets.chomp
      puts "Enter x coordinate of large boat"
      x = gets.chomp
      puts "Enter orientation of large boat"
      orientation = gets.chomp
      boat = Boat.new(size, y, x, orientation)
      player.add_boat(boat)
      end
  end
end
