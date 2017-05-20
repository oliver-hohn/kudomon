class KudomonTypes
  ELECTRIC = "ELECTRIC"
  FIRE = "FIRE"
  GRASS = "GRASS"
  PSYCHIC = "PSYCHIC"
  ROCK = "ROCK"
  WATER = "WATER"
end

class KudomonLifeCycle
  FREE = "FREE"
  BEING_CAUGHT = "BEING_CAUGHT"
  CAUGHT = "CAUGHT"
end

class Kudomon
  attr_reader :name, :xPos, :yPos, :type, :life_cyc #classes inheriting Kudomon have access to these
  attr_writer :life_cyc

  def initialize(n, x, y, t)
    @name, @xPos, @yPos, @type, @life_cyc = n, x, y, t, KudomonLifeCycle::FREE
  end

end


