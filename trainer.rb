require "./kudomon"
require "./game"
# Represents the Trainer's in the Game
class Trainer
  # Sets up the position of the Trainer, and their name
  def initialize(n, x, y, g)
    @name, @xPos, @yPos, @game, @catched_kudomons = n, x, y, g, Array.new
    @game.add_trainer(self)
  end

  # Find the Kudomon's in the Game field close to the position of the Trainer
  def find_kudomons()
    kudomons = @game.kudomons
    nearby_kudomons = Array.new
    #from the list of kudomons, find the ones close to xpos, ypos
    search_range = 10
    kudomons.each {|k|
      if in_range?(search_range, k)
        #k is in range
        nearby_kudomons << k
      end
    }
    return nearby_kudomons
  end

  # Attempt to catch the given Kudomon.
  # Returns a boolean confirming whether the given Kudomon was caught
  def catch_kudomon(k)
    #try to catch the given kudomon
    search_range = 10
    if can_catch?(search_range, k)
      #in range, and it is not being caught by others
      k.life_cyc = KudomonLifeCycle::BEING_CAUGHT
      @catched_kudomons << k
      @game.remove_kudomon(k) #removing caught kudomon from game area
      k.life_cyc = KudomonLifeCycle::CAUGHT
      return true
    end
    false
  end

  # Check if the Kudomon can be caught, i.e. in range and it is FREE to be caught
  def can_catch?(r, k)
    in_range?(r, k) && k.life_cyc == KudomonLifeCycle::FREE
  end

  # Check if given Kudomon is in our range
  def in_range?(r, k)
    k.xPos >= (@xPos -r) && k.xPos <= (@xPos+r) && k.yPos >= (@yPos -r) && k.yPos <= (@yPos +r)
  end

  private :in_range?, :can_catch?

end

