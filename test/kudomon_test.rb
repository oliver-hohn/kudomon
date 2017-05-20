require 'test/unit'
require './kudomon'

class KudomonTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
    @k1 = Kudomon.new("Kudomon 1", 5, 5, KudomonTypes::WATER, 10)
    @k2 = Kudomon.new("Kudomon 2", 8, 8, KudomonTypes::FIRE, 10)
    @k3 = Kudomon.new("Kudomon 3", 5, 5, KudomonTypes::PSYCHIC, 10)
    @k4 = Kudomon.new("Kudomon 4", 8, 8, KudomonTypes::PSYCHIC, 10)
  end

  # Test the expected winner of a Kudomon battle, where an Kudomon k1 is effective against a Kudomon k2, then
  # k1 should beat k2
  def test_battle_effectiveness
    winner = @k1.battle(@k2)
    assert_equal @k1, winner
  end


  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail
    fail('Not implemented')
  end
end