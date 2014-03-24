#encoding: utf-8
require_relative '../lib/game_engine.rb'
require 'test/unit'

class RPSTest < Test::Unit::TestCase

  def test_winning_moves
    assert GameEngine.available_moves == [:rock,:paper,:scissors]
  end

  def test_resolve_tie
    output = GameEngine.resolve(['p1', 'p2'], :rock, :rock)
    expected_output = "P1 picked rock and p2 rock, it's a tie!"
    assert output == expected_output
  end

  def test_resolve_p1_win
    output = GameEngine.resolve(['p1', 'p2'], :paper, :rock)
    expected_output = "P1 picked paper and p2 rock, p1 won!"
    assert output == expected_output
  end

  def test_resolve_p2_win
    output = GameEngine.resolve(['p1', 'p2'], :paper, :scissors)
    expected_output = "P1 picked paper and p2 scissors, p2 won!"
    assert output == expected_output
  end

  def test_random_move
    [:rock,:paper,:scissors].include?(GameEngine.random_move)
  end

end
