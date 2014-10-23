require_relative 'board'
STDOUT.sync = true

puts "Welcome to Tic Tac Toe!"
puts "You can make a move by entering a coordinate eg. 'a1'"
board = Board.new

until board.status == 'complete'
  board.draw
  puts "Player 1: where would you like to move?"
  position = gets.chomp
  board.move(position, :p1)
  board.check_for_win
  board.draw
  puts "Player 2: where would you like to move?"
  position = gets.chomp
  board.move(position, :p2)
  board.check_for_win
end
puts "Thank you for playing."
