require 'pry'
class Board
  require 'terminal-table'
  attr_accessor :board

  def initialize
    @table = []
    @row1 = [1,'', '', '']
    @row2 = [2,'', '', '']
    @row3 = [3,'', '', '']

    @table << @row1
    @table << :separator
    @table << @row2
    @table << :separator
    @table << @row3
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

    mark = player == :p1 ? 'X' :  'O'
    y[x] = mark

    self.draw
  end
end
