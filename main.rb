require './game'
require './trainer'
require './kudomon'


class Main
end


g = Game.new
t = Trainer.new("Timmy", 5, 4, g)
ti = Kudomon.new("Potato", 4, 7, KudomonTypes::GRASS)
tp = Kudomon.new("Psychic Boy", 50, 96, KudomonTypes::PSYCHIC)

g.add_kudomon(ti)
g.add_kudomon(tp)
nearby = t.find_kudomons
nearby.each {|k|
  if t.catch_kudomon(k)
    puts "Caught: #{k}"
  end
}
puts t.catch_kudomon(tp)


