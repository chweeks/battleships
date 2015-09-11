class Boat

  attr_accessor :boat_position

  def initialize(size, grid_ref, orientation)
    @boat_position = []
    size.times do
      boat_position << grid_ref
      split_grid_ref = grid_ref.split('',2)
      letter, number = split_grid_ref[0].ord, split_grid_ref[1].to_i
      number += 1 if orientation == 'south'
      number -= 1 if orientation == 'north'
      (letter += 1).chr if orientation == 'east'
      (letter -= 1).chr if orientation == 'west'
      number = number.to_s
      letter = letter.chr
      grid_ref = [letter, number].join
    end
  end

  def destroyed?
    boat_position.empty?
  end
end
