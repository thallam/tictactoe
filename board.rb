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

  def move(position)
    coordinate = []
    coordinate = position.chars #['A', '1']
    x = case
    when coordinate[0] = 'A' then @row1
    when coordinate[0] = 'B' then @row2
    when coordinate[0] = 'C' then @row3
    end

    y = coordinate[1].to_i
    x[y]= 'X'

    self.draw
  end
end
