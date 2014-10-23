require_relative 'board'
STDOUT.sync = true

puts "Welcome to Tic Tac Toe!"
puts "You can make a move by entering a coordinate eg. 'a1'"
board = Board.new
board.draw
puts "Player 1: where would you like to move?"
position = gets.chomp
board.move(position, :p1)
puts "Player 2: where would you like to move?"
position = gets.chomp
board.move(position, :p2)
puts "Thats all we have for the moment..."

