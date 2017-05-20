require './game'
require './trainer'
require './kudomon'

g = Game.new
t = Trainer.new("Timmy", 5, 4, g)
ti = Kudomon.new("Potato", 4, 7, KudomonTypes::GRASS, 15)
tp = Kudomon.new("Psychic Boy", 50, 96, KudomonTypes::PSYCHIC, 14)

g.add_kudomon(ti)
g.add_kudomon(tp)
nearby = t.find_kudomons
nearby.each {|k|
  if t.catch_kudomon(k)
    puts "Caught: #{k}"
  end
}
puts t.catch_kudomon(tp)


ti.battle(tp)


p1 = Kudomon.new("A", 5, 4, KudomonTypes::GRASS, 15)



