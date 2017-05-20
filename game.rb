require "./kudomon"

#holds the kudomons in the game, and their trainers
class Game
  attr_accessor :kudomons
  def initialize
    @kudomons, @trainers = Array.new, Array.new
  end

  def add_kudomon(k)
    @kudomons << k
  end

  def add_trainer(t)
    @trainers << t
  end


end

