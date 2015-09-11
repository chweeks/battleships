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

  def fire(player, grid_ref)
    player.harbour.each do |boat|
      if boat.boat_position.include?(grid_ref)
         hit(grid_ref)
         boat.boat_position.delete(grid_ref)
         player.harbour.delete(boat) if boat.destroyed?
         break
      else
         miss(grid_ref)
      end
    end
  end

  def loser?
    harbour.empty?
  end

  def hit(grid_ref)
    hits << grid_ref
  end

  def miss(grid_ref)
    misses << grid_ref if !misses.include?(grid_ref)
  end

  private

  def overlapping?(boat)
    harbour.each do |ship|
      fail 'ship overlapping' unless (ship.boat_position & boat.boat_position).empty?
    end
  end

end
