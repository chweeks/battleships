require_relative 'boat.rb'

class Player

  attr_accessor :harbour
  attr_accessor :add_boat
  attr_reader :hits
  attr_reader :misses

  def initialize
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
    boat.boat_position.include?(coord) ? hit(coord) : miss(coord)
    boat.boat_position.delete(coord)
    harbour.delete(boat) if boat.destroyed?
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
      fail 'ship overlapping' if ship.boat_position == boat.boat_position
    end
  end

end
