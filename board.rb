class Board
  require 'terminal-table'
  attr_accessor :board

  def initialize (board)
    @board = board
  end

def create

rows = []
rows << ['A', 'B', 'C']
rows << ['', '', '']
rows << ['', '', '']
rows << ['', '', '']
table = Terminal::Table.new :rows => rows
end


def to_s
  output =<<EOF
  A   B   C
1   |   |
2   |   |
3   |   |
EOF
end


end
