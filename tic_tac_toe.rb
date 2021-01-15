class TicTacToe
  def initialize(); end

  def self.get_user_input
    puts 'Player 1: Enter Your Name'
    player_one = gets.chomp.to_s
    puts 'Player 2: Enter Your Name'
    player_two = gets.chomp.to_s
    puts "#{player_one}: Do you want to play as X or O?"
    player_one_piece = gets.chomp.to_s.upcase
    while player_one_piece != 'X' && player_one_piece != 'O' && player_one_piece != "0"
      puts "#{player_one_piece} is not X or O, #{player_one}"
      player_one_piece = gets.chomp.to_s.upcase
    end
  end
end

class Game
  def intialize()

  end
end

TicTacToe.get_user_input