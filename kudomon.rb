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
  attr_reader :name, :xPos, :yPos, :type, :life_cyc, :hp, :cp #classes inheriting Kudomon have access to these
  attr_writer :life_cyc, :hp

  def initialize(n, x, y, t, c)
    @name, @xPos, @yPos, @type, @life_cyc, @hp, @cp = n, x, y, t, KudomonLifeCycle::FREE, 100, c
  end

  # Get Array of all the Types this Kudomon is striong against
  def get_effective_against(k)
    case k.type
      when KudomonTypes::WATER
        [KudomonTypes::FIRE]
      when KudomonTypes::FIRE
        [KudomonTypes::GRASS]
      when KudomonTypes::GRASS
        [KudomonTypes::ROCK]
      when KudomonTypes::ROCK
        [KudomonTypes::ELECTRIC]
      when KudomonTypes::ELECTRIC
        [KudomonTypes::WATER]
      when KudomonTypes::PSYCHIC
        [KudomonTypes::WATER, KudomonTypes::FIRE, KudomonTypes::GRASS, KudomonTypes::ROCK, KudomonTypes::ELECTRIC]
      else
        []
    end
  end

  def to_str
    "#{@name} - #{@type}: @(#{@xPos},#{@yPos}), HP: #{@hp}, CP: #{@cp}, #{@life_cyc}"
  end

  def battle(k)
    puts "#{self.name} vs #{k.name}"
    # Pick randomly which goes first
    kodomon_turn = rand(100) >= 50 ? self : k
    other = kodomon_turn === self ? k : self
    while k.hp > 0 && self.hp >0
      attack(kodomon_turn, other)
      tmp = kodomon_turn
      kodomon_turn = other
      other = tmp
    end
    return self.hp > 0 ? self : k
  end

  # a attacks d
  def attack(a,d)
    d.hp = d.hp - (a.cp*effective_val(a,d))
    puts "#{a.name} attacks #{d.name} for #{(a.cp*effective_val(a,d))}. #{d.name} HP is: #{d.hp}"
  end

  # Returns a multiplier of effectiveness of a attacking d
  def effective_val(a,d)
    # Check whether the attacker is effective against the defender d
    if get_effective_against(a).include?(d.type)
      2.0
    elsif get_effective_against(d).include?(a.type) || a.type == d.type && a.type==KudomonTypes::PSYCHIC
      0.5
    else
      1.0
    end
  end

  private :attack, :get_effective_against
end


