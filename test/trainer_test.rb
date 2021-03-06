require 'test/unit'
require './game'
require './trainer'
require './kudomon'

class TrainerTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @game = Game.new
    @trainer = Trainer.new("Timmy", 5, 10, @game)
    @trainer2 = Trainer.new("Bobby", 5, 9, @game)
    @kudomon_1 = Kudomon.new("Kudomon 1", 25, 55, KudomonTypes::WATER, 15)
    @game.add_kudomon(@kudomon_1)
    @game.add_trainer(@trainer)
    @kudomon_2 = Kudomon.new("Kudomon 2", 8, 4, KudomonTypes::ELECTRIC, 14)
    @game.add_kudomon(@kudomon_2)
  end

  # Test correct Kudomons are found
  def test_find_kudomons
    actual = @trainer.find_kudomons()
    expected = Array.new
    expected << @kudomon_2
    assert_equal expected, actual
  end

  # Tests only reachable Kudomons can be caught
  def test_catch_kudomon
    assert_true (@trainer.catch_kudomon(@kudomon_2))
    assert_false (@trainer.catch_kudomon(@kudomon_1))
  end

  # Tests catching Kudomons that are being caught by others
  def test_catching_caught_kudomon
    @kudomon_2.life_cyc=KudomonLifeCycle::BEING_CAUGHT
    assert_false (@trainer.catch_kudomon(@kudomon_2))
    @kudomon_2.life_cyc= KudomonLifeCycle::CAUGHT
    assert_false (@trainer.catch_kudomon(@kudomon_2))
    @kudomon_2.life_cyc= KudomonLifeCycle::FREE
    assert_true(@trainer.catch_kudomon(@kudomon_2))
  end

  # Tests two trainers attempting to catch a Kudomon.
  # First trainer to attempt to catch should be able to, other trainer should not be able to.
  def test_successive_catching
    assert_true(@trainer.catch_kudomon(@kudomon_2))
    assert_false(@trainer2.catch_kudomon(@kudomon_2))
    assert_true(@trainer.catched_kudomons.include? @kudomon_2)
    assert_false(@trainer2.catched_kudomons.include? @kudomon_2)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end

end