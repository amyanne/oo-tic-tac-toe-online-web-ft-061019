require 'pry'
class TicTacToe
 WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6]
]
 def initialize(board = nil)
   @board = board || Array.new(9," ")
 end

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(input)
   input = input.to_i - 1
 end

 def move(number, letter = "X")
   @board[number] = letter
 end

 def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
 end

 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end

 def turn_count
   @board.count {|l| l == "X" || l == "O"}
 end

 def current_player
   if turn_count.even?
     "X"
   else
     "O"
   end
 end

 def turn
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   char = current_player
   if valid_move?(index)
     move(index, char)
     display_board
   else
     turn
 end
 end

 def won?
   WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
   end
 end

 def full?
        @board.all?{|content| content != " "}
    end

 def draw?
        !(won?) && (full?)
    end

 def over?
        won? || full? || draw?
    end

   def winner
        WIN_COMBINATIONS.detect do |combo|
          if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
            return "X"
          elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
            return "O"
          else
            nil
          end
        end
    end
    
    def play
        while != 
        turn 
        if draw?
          puts "Cat's Game!"
        elsif won?
          puts "Congratulations #{winner}!"
        end 
      end

end
