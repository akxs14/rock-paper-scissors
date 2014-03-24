#encoding: utf-8
module GameEngine

  @winning_moves = {
      :rock => :scissors,
      :paper => :rock,
      :scissors => :paper
  }

  def self.available_moves
    @winning_moves.keys
  end

  def self.resolve players, player1_move, player2_move 
    case
    when player1_move == player2_move
      "#{players[0].capitalize} picked #{player1_move} and #{players[1]} #{player2_move}, it's a tie!"
    when @winning_moves[player1_move] == player2_move
      "#{players[0].capitalize} picked #{player1_move} and #{players[1]} #{player2_move}, #{players[0]} won!"
    when @winning_moves[player1_move] != player2_move
      "#{players[0].capitalize} picked #{player1_move} and #{players[1]} #{player2_move}, #{players[1]} won!"
    end
  end

  def self.random_move
    @winning_moves[@winning_moves.keys.sample]    
  end
end