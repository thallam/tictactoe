require 'pry'
require 'terminal-table'

class Board

  attr_reader :status

  def initialize
    @status = "in progress"

    @table = []
    @board = []

    @row1 = [1,'', '', '']
    @row2 = [2,'', '', '']
    @row3 = [3,'', '', '']

    @table << @row1
    @table << :separator
    @table << @row2
    @table << :separator
    @table << @row3

    @board << @row1
    @board << @row2
    @board << @row3
  end


  def draw
    drawing = Terminal::Table.new :headings => ['','A', 'B', 'C'],:rows => @table
    puts drawing
  end

  def move(position, player)
    coordinate = []
    coordinate = position.chars #['A', '1']
    x = case
    when coordinate[0] == 'a' then 1
    when coordinate[0] == 'b' then 2
    when coordinate[0] == 'c' then 3
    end

    y = case
    when coordinate[1] == '1' then @row1
    when coordinate[1] == '2' then @row2
    when coordinate[1] == '3' then @row3
    end

    mark = player == "Player 1" ? 'X' :  'O'
    if y[x].empty?
      y[x] = mark
    else
      puts "You can't move there silly! You just lost your turn!"
    end
  end

  def check_for_win

    win1 = "XXX"
    win2 = "OOO"
#binding.pry
    case
    when @board[0][1]+@board[0][2]+@board[0][3] == (win1 || win2) then winner
    when @board[1][1]+@board[1][2]+@board[1][3] == (win1 || win2) then winner
    when @board[2][1]+@board[2][2]+@board[2][3] == (win1 || win2) then winner

    when @board[0][1]+@board[1][1]+@board[2][1] == (win1 || win2) then winner
    when @board[0][2]+@board[1][2]+@board[2][2] == (win1 || win2) then winner
    when @board[0][3]+@board[1][3]+@board[2][3] == (win1 || win2) then winner

    when @board[0][1]+@board[1][2]+@board[2][3] == (win1 || win2) then winner
    when @board[0][3]+@board[1][2]+@board[2][1] == (win1 || win2) then winner
    else
      puts "Next move..."
    end
  end


  def winner
    @status = "complete"
    puts "We have a winner!!!"
  end



end













