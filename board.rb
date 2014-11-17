  require 'pry'
  require 'terminal-table'
  require_relative 'invalid_move_exception'


# Board represents a tic tac toe board.
class Board
  WIN_COMBINATIONS= [
    [[2,1],[2,2],[2,3]],
    [[0,1],[1,1],[2,1]],
    [[0,2],[1,2],[2,2]],
    [[0,3],[1,3],[2,3]],
    [[0,1],[1,2],[2,3]],
    [[0,3],[1,2],[2,1]]
  ]

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

    if y[x].empty?
      y[x] = player.name
    else
      raise InvalidMoveException.new "Invalid Move, #{player} tried to move to #{position}"
    end
  end

  def winner?(*ary)
    ary.uniq.count == 1 && ! ary.include?(nil)  && ! ary.include?('')
  end

  def won?
    # find
    WIN_COMBINATIONS.each do |e|
      first = e[0]
      second = e[1]
      third = e[2]
      first_token = @board[first[0]][first[1]]
      second_token = @board[second[0]][second[1]]
      third_token = @board[third[0]][third[1]]

      return true if winner?(first_token,second_token,third_token)
    end

    false
  end

  def draw?
    @board.flatten.none?{|e| e.empty?} && ! won?
  end

end













