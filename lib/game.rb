class Game

  attr_accessor :player_1
  attr_accessor :player_2


  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @boat_sizes = [2, 1, 1]
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
