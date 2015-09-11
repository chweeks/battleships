require_relative 'player.rb'
require_relative 'boat.rb'

class Game

  attr_accessor :player_1, :player_2
  attr_reader :grid_size

  def initialize(grid_size = 10)
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
    @boat_sizes = [2, 1, 1]
    @grid_size = grid_size
    self.start_game
  end

  def out_of_bounds?(boat)
    boat.boat_position.each do |grid_ref|
      grid_ref_split = grid_ref.split('', 2)
      letter = (grid_ref_split[0])
      number = (grid_ref_split[1]).to_i
      fail 'ship out of bounds' if letter > 'J' || letter < 'A' ||
       number > 10 || number < 1
    end
  end

  def create_boats(player)
    @boat_sizes.each do |size|
      puts "Enter coordinates of boat with length #{size}, eg. A1"
      grid_ref = gets.chomp
      puts "Enter orientation of boat with length #{size} eg. north"
      orientation = gets.chomp
      boat = Boat.new(size, grid_ref, orientation)
      out_of_bounds?(boat)
      player.add_boat(boat)
    end
  end

  def turn(agressor, victim)
    puts "#{agressor.name}'s turn"
    puts "Enter grid ref for firing"
    grid_ref = gets.chomp
    agressor.fire(victim, grid_ref)
    puts "HITS: #{agressor.hits}"
    puts "MISSES: #{agressor.misses}"
  end

  def gameplay
    until ( player_1.loser? || player_2.loser? )
      turn(player_1, player_2)
      player_2.loser? ? break : turn(player_2, player_1)
    end
  end

  def result
    if player_2.loser?
      puts "​#{player_1.name} You Win!, #{player_2.name} You Suck"
    else
      puts "​#{player_1.name} You Win!, #{player_2.name} You Suck"
    end
  end

  def start_game
    puts 'Player 1 boat setup'
    create_boats(player_1)
    puts 'Player 2 boat setup'
    create_boats(player_2)
    gameplay
    result
  end

end
