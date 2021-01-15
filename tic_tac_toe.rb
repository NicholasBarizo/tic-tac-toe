class TicTacToe
  def initialize(); end

  def begin
    get_user_input
  end

  private

  def get_user_input
    puts 'Player 1: Enter Your Name'
    player_one = gets.chomp.to_s
    puts 'Player 2: Enter Your Name'
    player_two = gets.chomp.to_s

    puts "#{player_one}: Do you want to play as X or O?"
    player_one_piece = gets.chomp.to_s.upcase
    while player_one_piece != 'X' && player_one_piece != 'O' && player_one_piece != '0'
      puts "#{player_one_piece} is not X or O, #{player_one}"
      player_one_piece = gets.chomp.to_s.upcase
    end

    player_one_piece = 'O' if player_one_piece == '0'
    play_game(player_one, player_two, player_one_piece)
  end

  def play_game(player_one, player_two, player_one_piece)
    won = false
    pos_one = "-"
    pos_two = "-"
    pos_three = "-"
    pos_four = "-"
    pos_five = "-"
    pos_six = "-"
    pos_seven = "-"
    pos_eight = "-"
    pos_nine = "-"
    # until won == true
      
    # end
    marks = [pos_one, pos_two, pos_three, pos_four, pos_five, pos_six, pos_seven, pos_eight, pos_nine]
    put_board(marks)
  end

  def put_board(marks)

    puts
    puts "  #{marks[0]}  |  #{marks[1]}  |  #{marks[2]}  "
    puts '_________________'
    puts
  puts "  #{marks[3]}  |  #{marks[4]}  |  #{marks[5]}  "
    puts '_________________'
    puts
    puts "  #{marks[6]}  |  #{marks[7]}  |  #{marks[8]}  "
    puts
  end
end

TicTacToe.new.begin
