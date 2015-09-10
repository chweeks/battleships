require_relative 'boat.rb'

class Player

  attr_accessor :harbour, :add_boat
  attr_reader :hits, :misses, :name

  def initialize(name)
    @name = name
    @harbour = []
    @hits = []
    @misses = []
  end

  def add_boat(boat)
    overlapping?(boat)
    harbour << boat
  end

  def fire(player, coord)
    player.harbour.each do |boat|
      if boat.boat_position.include?(coord)
         hit(coord)
         boat.boat_position.delete(coord)
         player.harbour.delete(boat) if boat.destroyed?
         break
      else
         miss(coord)
      end
    end
  end

  def loser?
    harbour.empty?
  end

  def hit(coord)
    hits << coord

  end

  def miss(coord)
    misses << coord if !misses.include?(coord)
  end

  private

  def overlapping?(boat)
    harbour.each do |ship|
      fail 'ship overlapping' unless (ship.boat_position & boat.boat_position).empty?
    end
  end

end
