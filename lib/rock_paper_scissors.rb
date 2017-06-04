class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    unless player1[1] =~ /^[RPS]$/ && player2[1] =~ /^[RPS]$/ then raise NoSuchStrategyError, "Strategy must be one of R,P,S" end
    if player1[1] == player2[1] then return player1 end
    if player1[1] == "R" && player2[1] == "S" then return player1 end
    if player1[1] == "R" && player2[1] == "P" then return player2 end
    if player1[1] == "P" && player2[1] == "R" then return player1 end
    if player1[1] == "P" && player2[1] == "S" then return player2 end
    if player1[1] == "S" && player2[1] == "R" then return player2 end
    if player1[1] == "S" && player2[1] == "P" then return player1 end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a? String then return winner(tournament[0], tournament[1]) end
    return winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
  end
end
