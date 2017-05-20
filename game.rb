require "./kudomon"

# Holds the kudomons in the game, and their trainers
class Game
  attr_accessor :kudomons

  # Sets up the list of Kudmon's, and Trainers in the game
  def initialize
    @kudomons, @trainers = Array.new, Array.new
  end

  # Add a Kudomon k to the list of Kudmon's  currently in the field of the game
  def add_kudomon(k)
    @kudomons << k
  end

  # Add a Trainer t to the lis of Trainer's currently in the game
  def add_trainer(t)
    @trainers << t
  end

  # Remove Kudomon from the game area
  def remove_kudomon(k)
    @kudomons.delete(k)
  end

end

