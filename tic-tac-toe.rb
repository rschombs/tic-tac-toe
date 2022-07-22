class Gameboard
  attr_accessor :state, :turns
  
  @turns = 0

  def initialize
    @state = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @turns = 0
  end

  def make_X(choice)
    @state[choice- 1] = "X"
    @turns += 1
  end

  def make_O(choice)
    @state[choice - 1] = "O"
    @turns += 1
  end

  def display_board
    puts " #{@state[0]} | #{@state[1]} | #{@state[2]} "
    puts "-----------"
    puts " #{@state[3]} | #{@state[4]} | #{@state[5]} "
    puts "-----------"
    puts " #{@state[6]} | #{@state[7]} | #{@state[8]} "
  end

  def winner_checker(mark)
    row_1_checker(mark) || row_2_checker(mark) || row_3_checker(mark) || column_1_checker(mark) || column_2_checker(mark) || column_3_checker(mark) || diagonal_1_checker(mark) || diagonal_2_checker(mark)
  end

  def row_1_checker(mark)
    @state[0] == mark && @state[1] == mark && @state[2] == mark
  end

  def row_2_checker(mark)
    @state[3] == mark && @state[4] == mark && @state[5] == mark
  end

  def row_3_checker(mark)
    @state[6] == mark && @state[7] == mark && @state[8] == mark

  end

  def column_1_checker(mark)
    @state[0] == mark && @state[3] == mark && @state[6] == mark

  end

  def column_2_checker(mark)
    @state[1] == mark && @state[4] == mark && @state[7] == mark
  end

  def column_3_checker(mark)
    @state[2] == mark && @state[5] == mark && @state[8] == mark
  end

  def diagonal_1_checker(mark)
    @state[0] == mark && @state[4] == mark && @state[8] == mark
  end

  def diagonal_2_checker(mark)
    @state[2] == mark && @state[4] == mark && @state[6] == mark
  end

end


def play_game
  game_is_over = 0
  turn = "X"

  gameboard = Gameboard.new()

  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "  

  while game_is_over == 0
    if turn == "X"
      puts "Player X: Select your square!"
      selection = gets.chomp.to_i
      if (1..9) === selection && gameboard.state[selection - 1] != "X" && gameboard.state[selection - 1] != "O"
        gameboard.make_X(selection)
      else
        puts "Doesn't work. Pick again!"
        next
      end
      gameboard.display_board
      game_is_over = 2 if gameboard.turns == 9
      game_is_over = 1 if gameboard.winner_checker("X")
      turn = "O"
    else 
      puts "Player O: Select your square!"
      selection = gets.chomp.to_i
      if (1..9) === selection && gameboard.state[selection - 1] != "X" && gameboard.state[selection - 1] != "O"
        gameboard.make_O(selection) 
      else
        puts "Doesn't work. Pick again!"
        next
      end
      gameboard.display_board
      game_is_over = 2 if gameboard.turns == 9
      game_is_over = -1 if gameboard.winner_checker("O")   
      turn = "X"
    end
  end
  case game_is_over 
  when 1
    puts "X wins! Congratulations!"
  when -1
    puts "O wins! Congratulations!"
  else 
    puts "The game is a tie."
  end
end

play_game