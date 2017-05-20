require "./kudomon"
require "./game"
# Represents the Trainer's in the Game
class Trainer
  SEARCH_RANGE = 6

  attr_reader :catched_kudomons, :name
  # Sets up the position of the Trainer, and their name
  # n - Trainers name
  # x - Trainers x co-ordinate in the game map
  # y - Trainers y co-ordinate in the game map
  # g - The Game the Trainer is in
  def initialize(n, x, y, g)
    @name, @xPos, @yPos, @game, @catched_kudomons = n, x, y, g, Array.new
    @game.add_trainer(self)
  end

  # Find the Kudomon's in the Game field close to the position of the Trainer
  def find_kudomons()
    kudomons = @game.kudomons
    nearby_kudomons = Array.new
    #from the list of kudomons, find the ones close to xpos, ypos
    kudomons.each {|k|
      if in_range?(SEARCH_RANGE, k)
        #k is in range
        nearby_kudomons << k
      end
    }
    return nearby_kudomons
  end

  # Attempt to catch the given Kudomon k.
  # Returns a boolean confirming whether the given Kudomon was caught
  def catch_kudomon(k)
    #try to catch the given kudomon
    if can_catch?(SEARCH_RANGE, k)
      #in range, and it is not being caught by others
      k.life_cyc = KudomonLifeCycle::BEING_CAUGHT
      @catched_kudomons << k
      @game.remove_kudomon(k) #removing caught kudomon from game area
      k.life_cyc = KudomonLifeCycle::CAUGHT
      return true
    end
    false
  end

  # Check if the Kudomon k can be caught, i.e. in range r and it is FREE to be caught
  def can_catch?(r, k)
    in_range?(r, k) && k.life_cyc == KudomonLifeCycle::FREE
  end

  # Check if given Kudomon k is in our range r
  def in_range?(r, k)
    k.xPos >= (@xPos -r) && k.xPos <= (@xPos+r) && k.yPos >= (@yPos -r) && k.yPos <= (@yPos +r)
  end

  private :in_range?, :can_catch?

end

