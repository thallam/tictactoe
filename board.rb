require 'pry'
require 'terminal-table'
require_relative 'invalid_move_exception'

# Board represents a tic tac toe board.
class Board

  attr_reader :status

  def initialize
    @row1 = ['1','', '', '']
    @row2 = ['2','', '', '']
    @row3 = ['3','', '', '']


    @board = [@row1 , @row2 , @row3]
    @table = [@row1, :separator, @row2, :separator, @row3]
  end



  def render
    drawing = Terminal::Table.new :headings => ['','A', 'B', 'C'],:rows => @table
    puts drawing
  end

  def move(position, player)
    #coordinate = []
    coordinate = position.chars #['A', '1']
    x = case coordinate[0]
    when 'a' then 1
    when 'b' then 2
    when 'c' then 3
    end

    y = case coordinate[1]
    when '1' then @row1
    when '2' then @row2
    when '3' then @row3
    end

    mark = player == "Player 1" ? 'X' :  'O'
    if y[x].empty?
      y[x] = mark
    else
      raise InvalidMoveException.new "Invalid Move, #{player} tried to move to #{position}"
    end
  end

  def won?

    win1 = "XXX"
    win2 = "OOO"

    case
    when @board[0][1]+@board[0][2]+@board[0][3] == (win1 || win2) then return true
    when @board[1][1]+@board[1][2]+@board[1][3] == (win1 || win2) then return true
    when @board[2][1]+@board[2][2]+@board[2][3] == (win1 || win2) then return true

    when @board[0][1]+@board[1][1]+@board[2][1] == (win1 || win2) then return true
    when @board[0][2]+@board[1][2]+@board[2][2] == (win1 || win2) then return true
    when @board[0][3]+@board[1][3]+@board[2][3] == (win1 || win2) then return true

    when @board[0][1]+@board[1][2]+@board[2][3] == (win1 || win2) then return true
    when @board[0][3]+@board[1][2]+@board[2][1] == (win1 || win2) then return true

    else
      false
    end
  end


  def draw?
    @board.flatten.none?{|e| e.empty?} && ! won?
  end

end













