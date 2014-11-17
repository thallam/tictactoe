# This game represents two players making their marks on a board until win or draw

require_relative 'board'
require_relative 'player'
STDOUT.sync = true

board = Board.new

player1 = Player.new('X')
player2 = Player.new('O')
current_player = player2

puts "Welcome to Tic Tac Toe!"
puts "You can make a move by entering a coordinate eg. 'a1'"

loop do
  board.render
  current_player = case current_player
                      when player1 then player2
                      when player2 then player1
                    end
#binding.pry
  begin
    puts "#{current_player}: where would you like to move?"
    position = gets.chomp
    board.move(position, current_player)
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
