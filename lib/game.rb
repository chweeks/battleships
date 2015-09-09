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
      puts "Enter x coordinate of boat"
      x = gets.chomp.to_i
      puts "Enter y coordinate of boat"
      y = gets.chomp.to_i
      puts "Enter orientation of boat"
      orientation = gets.chomp
      boat = Boat.new(size, x, y, orientation)
      out_of_bounds?(boat)
      player.add_boat(boat)
    end
  end

  def turn
    until ( player_1.loser? || player_2.loser? )
      puts "Player 1's turn"
      puts "Enter x coordinate for firing"
      x = gets.chomp.to_i
      puts "Enter y coordinate for firing"
      y = gets.chomp.to_i
      player_1.fire(player_2, [x,y])
      puts "HITS: #{player_1.hits}"
      puts "MISSES: #{player_1.misses}"
      puts "Player 2's turn"
      puts "Enter x coordinate for firing"
      x = gets.chomp.to_i
      puts "Enter y coordinate for firing"
      y = gets.chomp.to_i
      player_2.fire(player_1, [x,y])
      puts "HITS: #{player_2.hits}"
      puts "MISSES: #{player_2.misses}"
    end
  end

  def result
    if player_2.loser?
      puts "​
____    ____   ______    __    __      __        ______        _______. _______
\   \  /   /  /  __  \  |  |  |  |    |  |      /  __  \      /       ||   ____|
 \   \/   /  |  |  |  | |  |  |  |    |  |     |  |  |  |    |   (----`|  |__
  \_    _/   |  |  |  | |  |  |  |    |  |     |  |  |  |     \   \    |   __|
    |  |     |  `--'  | |  `--'  |    |  `----.|  `--'  | .----)   |   |  |____
    |__|      \______/   \______/     |_______| \______/  |_______/    |_______|

   .______    __           ___      ____    ____  _______ .______          ___
   |   _  \  |  |         /   \     \   \  /   / |   ____||   _  \        |__ \
   |  |_)  | |  |        /  ^  \     \   \/   /  |  |__   |  |_)  |          ) |
   |   ___/  |  |       /  /_\  \     \_    _/   |   __|  |      /          / /
   |  |      |  `----. /  _____  \      |  |     |  |____ |  |\  \----.    / /_
   | _|      |_______|/__/     \__\     |__|     |_______|| _| `._____|   |____|
                                                                                 "
    else
      puts "​
____    ____   ______    __    __      __        ______        _______. _______
\   \  /   /  /  __  \  |  |  |  |    |  |      /  __  \      /       ||   ____|
 \   \/   /  |  |  |  | |  |  |  |    |  |     |  |  |  |    |   (----`|  |__
  \_    _/   |  |  |  | |  |  |  |    |  |     |  |  |  |     \   \    |   __|
    |  |     |  `--'  | |  `--'  |    |  `----.|  `--'  | .----)   |   |  |____
    |__|      \______/   \______/     |_______| \______/  |_______/    |_______|

   .______    __           ___      ____    ____  _______ .______          __
   |   _  \  |  |         /   \     \   \  /   / |   ____||   _  \        /_ |
   |  |_)  | |  |        /  ^  \     \   \/   /  |  |__   |  |_)  |        | |
   |   ___/  |  |       /  /_\  \     \_    _/   |   __|  |      /         | |
   |  |      |  `----. /  _____  \      |  |     |  |____ |  |\  \----.    | |
   | _|      |_______|/__/     \__\     |__|     |_______|| _| `._____|    |_|  "
    end
  end

  def start_game
    puts 'Player 1 boat setup'
    create_boats(player_1)
    puts 'Player 2 boat setup'
    create_boats(player_2)
    turn
    result
  end

end
