class KudomonTypes
  ELECTRIC = "ELECTRIC"
  FIRE = "FIRE"
  GRASS = "GRASS"
  PSYCHIC = "PSYCHIC"
  ROCK = "ROCK"
  WATER = "WATER"
end

class Kudomon
  attr_reader :name, :xPos, :yPos #classes inheriting Kudomon have access to these

  def initialize(n, x, y, t)
    @name, @xPos, @yPos, @type = n, x, y, t
    puts "#{name}, #{xPos}, #{yPos}, #{@type}"
  end

end


