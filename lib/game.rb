require_relative 'player.rb'
require_relative 'boat.rb'

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

  def out_of_bounds?(boat)
    boat.boat_position.each do |coords|
      coords.each do |coord|
        fail 'ship out of bounds' if coord > (grid_size - 1) || coord < 0
      end
    end
  end

  def create_boats(player)
    @boat_sizes.each do |size|
      puts "Enter y coordinate of large boat"
      y = gets.chomp.to_i
      puts "Enter x coordinate of large boat"
      x = gets.chomp.to_i
      puts "Enter orientation of large boat"
      orientation = gets.chomp
      boat = Boat.new(size, y, x, orientation)
      out_of_bounds?(boat)
      player.add_boat(boat)
      end
  end
end
