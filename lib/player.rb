class Player

  attr_accessor :harbor
  attr_accessor :add_boat
  attr_reader :hits
  attr_reader :misses

  def initialize
    @harbor = []
    @hits = []
    @misses = []
  end

  def add_boat(boat)
    overlapping?(boat)
    @harbor << boat
  end

  def launch(player, coord)
    player.harbor.each do |boat|
      boat.boat_position.include?(coord) ? hit(coord) : miss(coord)
      boat.boat_position.delete(coord)
    end
  end

  def hit(coord)
    @hits << coord
  end

  def miss(coord)
    @misses << coord
  end

  private

  def overlapping?(boat)
    @harbor.each do |ship|
      fail 'ship overlapping' if ship.boat_position == boat.boat_position
    end
  end

end
