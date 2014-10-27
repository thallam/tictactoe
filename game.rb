# This game represents two players making their marks on a board until win or draw

require_relative 'board'
STDOUT.sync = true

puts "Welcome to Tic Tac Toe!"
puts "You can make a move by entering a coordinate eg. 'a1'"
board = Board.new
player = ''

loop do
  board.render
  player == 'Player 1' ? player = 'Player 2' : player = 'Player 1'
  begin
    puts "#{player}: where would you like to move?"
    position = gets.chomp
    board.move(position, player)
  rescue InvalidMoveException => e
    puts e
    retry
  end
  break if board.won? || board.draw?
end
if board.won? then puts "We have a winner!" end
if board.draw? then puts "We have a draw... " end
board.render
puts "Thank you for playing."
