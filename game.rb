require_relative 'board'
puts "Welcome to Tic Tac Toe!"
board = Board.new
board.draw
puts "Where would you like to move?"
position = gets.chomp
board.move(position)
