require "./kudomon"
require "./game"

class Trainer
  def initialize(n, x, y, g)
    @name, @xPos, @yPos, @game, @catched_kudomons = n, x, y, g, Array.new
    @game.add_trainer(self)

  end

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
    return false
  end

  def can_catch?(r, k)
    return in_range?(r, k) && k.life_cyc == KudomonLifeCycle::FREE
  end

  def in_range?(r, k)
    #check if given kudomon is in our range
    return k.xPos >= (@xPos -r) && k.xPos <= (@xPos+r) && k.yPos >= (@yPos -r) && k.yPos <= (@yPos +r)
  end

  private :in_range?, :can_catch?

end

