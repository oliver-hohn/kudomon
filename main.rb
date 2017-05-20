require './game'
require './trainer'
require './kudomon'

g = Game.new

# The different entities in the Game
t1 = Trainer.new("Timmy", 5, 4, g)
t2 = Trainer.new("Bobby", 15, 22, g)
k1 = Kudomon.new("Grass Kudo", 4, 7, KudomonTypes::GRASS, 15)
k2 = Kudomon.new("Psychic Kudo", 1, -2, KudomonTypes::PSYCHIC, 14)
k3 = Kudomon.new("Water Kudo", 12, 18, KudomonTypes::WATER, 25)
k4 = Kudomon.new("Rock Kudo", 8, 8, KudomonTypes::ROCK, 18)
k5 = Kudomon.new("Electric Kudo", 16, 25, KudomonTypes::ELECTRIC, 23)
k6 = Kudomon.new("Psycho Kudo", 19, 24, KudomonTypes::PSYCHIC, 15)

# Add entities to the Game
g.add_kudomon(k1)
g.add_kudomon(k2)
g.add_kudomon(k3)
g.add_kudomon(k4)
g.add_kudomon(k5)
g.add_kudomon(k6)

# Trainer 1 (Timmy) catches their nearby Kudomons
nearby = t1.find_kudomons
nearby.each {|k|
  if t1.catch_kudomon(k)
    puts "#{t1.name} Caught: #{k.name}"
  end
}

# Trainer 2 (Bobby) catches their nearby Kudomons
nearby = t2.find_kudomons
nearby.each {|k|
  if t2.catch_kudomon(k)
    puts "#{t2.name}Caught: #{k.name}"
  end
}

# Psychic Types battling each other
k2.battle(k6)