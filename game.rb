require_relative 'board'
require_relative 'player'
STDOUT.sync = true

# Game represents two players making their marks on a board until win or draw.
class Game

  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "You can place a token in a square by entering its coordinate eg. 'a1'"
    puts "Player 1, what will you use as your token? eg. X"
    @player1 = Player.new(gets.chomp)
    puts "Player 2, what will you use as your token? eg. O"
    @player2 = Player.new(gets.chomp)

    @board = Board.new
    play(@board)
  end

  def play(board)
    current_player = @player2

    loop do
      board.render

      current_player =  current_player == @player2 ? @player1 : @player2

      begin
        puts "#{current_player}: where would you like to move?"
        position = gets.chomp.downcase
        board.move(position, current_player.to_s) ;nil #to suppress random token

      rescue InvalidMoveException => e
        puts e
        retry
      end

      break if board.won? || board.draw?
    end


    board.render
    puts "We have a winner! Congratulations #{current_player}!" if board.won?
    puts "We have a draw... " if board.draw?
    puts "Thank you for playing."
    exit

  end
end
