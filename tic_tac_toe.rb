class TicTacToe
  @@current_mark = 1
  @@marks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
    while player_two == player_one
      puts "Player 2, your name can not equal #{player_one}"
      player_two = gets.chomp.to_s
    end

    puts "#{player_one}: Do you want to play as X or O?"
    player_one_piece = gets.chomp.to_s.downcase
    while player_one_piece != 'x' && player_one_piece != 'o' && player_one_piece != '0'
      puts "#{player_one_piece} is not X or O, #{player_one}"
      player_one_piece = gets.chomp.to_s.downcase
    end

    player_one_piece = 'o' if player_one_piece == '0'
    play_game(player_one, player_two, player_one_piece)
  end

  def play_game(player_one, player_two, turn)
    start_turn = turn
    @@marks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    loop do
      if(turn == 'x')
        put_board()

        puts "Where would you like to move, #{player_one}?"
        player_one_move = gets.chomp.to_i
        while player_one_move.between?(1, 9) == false || @@marks[player_one_move - 1] == 'x' || @@marks[player_one_move - 1] == 'o'
          put_board()
          puts 'That is not a valid square'
          player_one_move = gets.chomp.to_i
        end
        
        @@marks[player_one_move - 1] = 'x'

        @@current_mark = 'x'
        if check_board_for_win()
          if start_turn == 'x'
            puts "#{player_one} wins!"
          elsif start_turn == 'o'
            puts "#{player_two} wins!"
          end

          puts "Play again? y/n"
          play_again = gets.chomp.downcase
          until play_again == 'y' || play_again == 'n'
            puts "#{play_again} is not y or n"
            play_again = gets.chomp.downcase
          end
          if play_again == 'y'
            TicTacToe.new.begin
          elsif play_again == 'n'
            puts "Goodbye!"
            exit
          end
        end
        turn = 'o'
      end
      if(turn == 'o')
        put_board()

        puts "Where would you like to move, #{player_two}?"
        player_one_move = gets.chomp.to_i
        while player_one_move.between?(1, 9) == false || @@marks[player_one_move - 1] == 'x' || @@marks[player_one_move - 1] == 'o'
          put_board()
          puts 'That is not a valid square'
          player_one_move = gets.chomp.to_i
        end
        
        @@marks[player_one_move - 1] = 'o'
        @@current_mark = 'o'
        if check_board_for_win()
          if start_turn == 'o'
            puts "#{player_one} wins 3!"
          elsif start_turn == 'x'
            puts "#{player_two} wins 4!"
          end

          puts "Play again? y/n"
          play_again = gets.chomp.downcase
          until play_again == 'y' || play_again == 'n'
            puts "#{play_again} is not y or n"
            play_again = gets.chomp.downcase
          end
          if play_again == 'y'
            TicTacToe.new.begin
          elsif play_again == 'n'
            puts "Goodbye!"
            exit
          end
        end
        turn = 'x'
      end
    end
    
  end

  def put_board()

    puts
    puts "  #{@@marks[0]}  |  #{@@marks[1]}  |  #{@@marks[2]}  "
    puts '_________________'
    puts
    puts "  #{@@marks[3]}  |  #{@@marks[4]}  |  #{@@marks[5]}  "
    puts '_________________'
    puts
    puts "  #{@@marks[6]}  |  #{@@marks[7]}  |  #{@@marks[8]}  "
    puts
  end

  def check_board_for_win()
    if check_line_for_win(0, 1, 2) || check_line_for_win(3, 4, 5) ||
        check_line_for_win(6, 7, 8) || check_line_for_win(0, 3, 6) || check_line_for_win(1, 4, 7) ||
        check_line_for_win(2, 5, 8) || check_line_for_win(0, 4, 8) || check_line_for_win(2, 4, 6)
      put_board()
      return true
    end

  end

  def check_line_for_win(one, two, three)
    return true if @@marks[one] == @@current_mark && @@marks[two] == @@current_mark && @@marks[three] == @@current_mark
  end
end

TicTacToe.new.begin
