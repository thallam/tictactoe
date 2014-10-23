require_relative 'board'
STDOUT.sync = true

puts "Welcome to Tic Tac Toe!"
puts "You can make a move by entering a coordinate eg. 'a1'"
board = Board.new
player = 'Player 2'

loop do
  board.draw
  player == 'Player 1' ? player = 'Player 2' : player = 'Player 1'
  puts "#{player}: where would you like to move?"
  position = gets.chomp
  board.move(position, player)
  board.check_for_win
  break if board.status == 'complete'
end
board.draw
puts "Thank you for playing."
