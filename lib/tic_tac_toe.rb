class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    num.to_i - 1
  end

  def move(i, token = "X")
    @board[i] = token
  end

  def position_taken?(i)
    @board[i] == " " || @board[i] == nil || @board[i] == "" ? false : true
  end

  def valid_move?(i)
    !position_taken?(i) && i.between?(0, 9)
  end

  def turn_count
    count = 0
    @board.each {|token| count += 1 if token == "X" || token == "O"}
    count
  end

  def current_player
    turn_count % 2 == 1 ? "O" : "X"
  end

  def turn
    #ask for input
    puts "Please choose a number between 1 and 9:"
    #get input
    input = gets.chomp
    #return index of input
    index = input_to_index(input)
    #if valid index make the move or else ask for input again
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    winning_combo = [];
    WIN_COMBINATIONS.each do |combo|
      combo.all?{|i| @board[i] == "X"} || combo.all?{|i| @board[i] == "O"} ? winning_combo = combo : false
    end
    winning_combo.length == 0 ? false : winning_combo
  end

  def full?
    !@board.any?{|token| token == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
