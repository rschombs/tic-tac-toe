class Space
  attr_accessor :entry
  
  def initialize(id, entry)
    @id = id
    @entry = "#{entry}" 
  end

  def make_X
    @entry = "X"
  end

  def make_O
    @entry = "O"
  end
end



def play_game
  game_is_over = 0
  turn = "X"
  space_1 = Space.new(1, "1")
  space_2 = Space.new(2, "2")
  space_3 = Space.new(3, "3")
  space_4 = Space.new(4, "4")
  space_5 = Space.new(5, "5")
  space_6 = Space.new(6, "6")
  space_7 = Space.new(7, "7")
  space_8 = Space.new(8, "8")
  space_9 = Space.new(9, "9")
  gameboard = [space_1, space_2, space_3, space_4, space_5, space_6, space_7, space_8, space_9]
  puts " #{space_1.entry} | #{space_2.entry} | #{space_3.entry} "
  puts "-----------"
  puts " #{space_4.entry} | #{space_5.entry} | #{space_6.entry} "
  puts "-----------"
  puts " #{space_7.entry} | #{space_8.entry} | #{space_9.entry} "

  while game_is_over == 0
    if turn == "X"
      puts "Player X: Select your square!"
    else 
      puts "Player O: Select your square!"
      turn = "O"
    end
  end
end

play_game