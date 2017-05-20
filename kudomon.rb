# Represents the different types of Kudomon's in the Game
class KudomonTypes
  ELECTRIC = "ELECTRIC"
  FIRE = "FIRE"
  GRASS = "GRASS"
  PSYCHIC = "PSYCHIC"
  ROCK = "ROCK"
  WATER = "WATER"
end

# Represents the states a Kudomon can be in, i.e. are they FREE in the wild,or are they being caught?
class KudomonLifeCycle
  FREE = "FREE"
  BEING_CAUGHT = "BEING_CAUGHT"
  CAUGHT = "CAUGHT"
end

# Represents a Kudomon in the system.
class Kudomon
  # Variables that can be accessed from the Kudomon (defining getters/setters)
  attr_reader :name, :xPos, :yPos, :type, :life_cyc, :hp, :cp
  attr_writer :life_cyc, :hp

  # Create a Kudomon with the required data, i.e. name, its position, type, etc.
  # n - Kudomon name (species)
  # x - Kudomons x co-ordinate in the game map
  # y - Kudomons y co-ordinate in the game map
  # t - Kudomons type, given by KudomonType
  # c - the CP, or Combat Points, of the Kudomon
  def initialize(n, x, y, t, c)
    @name, @xPos, @yPos, @type, @life_cyc, @hp, @cp = n, x, y, t, KudomonLifeCycle::FREE, 100, c
  end

  # Get Array of all the Types this Kudomon k is strong against
  def get_effective_against(k)
    case k.type
      when KudomonTypes::WATER then
        [KudomonTypes::FIRE]
      when KudomonTypes::FIRE then
        [KudomonTypes::GRASS]
      when KudomonTypes::GRASS then
        [KudomonTypes::ROCK]
      when KudomonTypes::ROCK then
        [KudomonTypes::ELECTRIC]
      when KudomonTypes::ELECTRIC then
        [KudomonTypes::WATER]
      when KudomonTypes::PSYCHIC then
        [KudomonTypes::WATER, KudomonTypes::FIRE, KudomonTypes::GRASS, KudomonTypes::ROCK, KudomonTypes::ELECTRIC]
      else
        []
    end
  end

  # Print information of the Kudomon
  def to_str
    "#{@name} - #{@type}: @(#{@xPos},#{@yPos}), HP: #{@hp}, CP: #{@cp}, #{@life_cyc}"
  end

  # Battle this Kudomon against Kudomon k.
  # Returns the winning Kudomon
  def battle(k)
    puts "#{self.name} vs #{k.name}"
    # Pick randomly which goes first
    while k.hp > 0 && self.hp >0
      kodomon_turn = rand(100) >= 50 ? self : k
      other = kodomon_turn === self ? k : self
      attack(kodomon_turn, other)
      if(other.hp > 0) # if other is still alive, it can attack
        attack(other, kodomon_turn)
      end
    end
    winner = self.hp > 0 ? self : k
    puts "Winner: #{winner.name}"
    return winner
  end

  # a Attacks d
  def attack(a, d)
    d.hp = d.hp - (a.cp*effective_val(a, d))
    puts "#{a.name} attacks #{d.name} for #{(a.cp*effective_val(a, d))}. #{d.name} HP is: #{d.hp}"
  end

  # Returns a multiplier of effectiveness of a attacking d
  def effective_val(a, d)
    # Check whether the attacker is effective against the defender d
    if get_effective_against(a).include?(d.type)
      2.0
    elsif get_effective_against(d).include?(a.type) || (a.type == d.type && a.type==KudomonTypes::PSYCHIC)
      0.5
    else
      1.0
    end
  end

  private :attack, :get_effective_against
end


