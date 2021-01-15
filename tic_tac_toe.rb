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
    while player_two == player_one
      puts "Player 2, your name can not equal #{player_one}"
      player_two = gets.chomp.to_s
    end

    puts "#{player_one}: Do you want to play as X or O?"
    player_one_piece = gets.chomp.to_s.upcase
    while player_one_piece != 'X' && player_one_piece != 'O' && player_one_piece != '0'
      puts "#{player_one_piece} is not X or O, #{player_one}"
      player_one_piece = gets.chomp.to_s.upcase
    end

    player_one_piece = 'O' if player_one_piece == '0'
    play_game(player_one, player_two, player_one_piece)
  end

  def play_game(player_one, player_two, turn)
    won = false

    marks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    until won == true
      if(turn == 'X')
        put_board(marks)

        puts "Where would you like to move, #{player_one}?"
        player_one_move = gets.chomp.to_i
        while player_one_move.between?(1, 9) == false
          puts 'That is not a valid square'
          player_one_move = gets.chomp
        end
        
        marks[player_one_move - 1] = 'X'


        if check_board_for_win(marks, "X")
          puts "Win"
        end
        turn = 'O'
      end
      if(turn == 'O')
        put_board(marks)

        puts "Where would you like to move, #{player_two}?"
        player_one_move = gets.chomp.to_i
        while player_one_move.between?(1, 9) == false
          puts 'That is not a valid square'
          player_one_move = gets.chomp
        end
        
        marks[player_one_move - 1] = 'O'

        check_board_for_win(marks, "O")
        turn = 'X'
      end
    end
    
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

  def check_board_for_win(marks, current_mark)
    return true if check_line_for_win(0, 1, 2, marks, current_mark) || check_line_for_win(3, 4, 5, marks, current_mark) ||
      check_line_for_win(6, 7, 8, marks, current_mark) || check_line_for_win(0, 3, 6, marks, current_mark) || check_line_for_win(1, 4, 7, marks, current_mark) ||
      check_line_for_win(2, 5, 8, marks, current_mark) || check_line_for_win(0, 4, 8, marks, current_mark) || check_line_for_win(2, 4, 6, marks, current_mark)

  end

  def check_line_for_win(one, two, three, marks, current_mark)
    return true if marks[one] == current_mark && marks[two] == current_mark && marks[three] == current_mark
  end
end

TicTacToe.new.begin
