require "minitest/autorun"
require_relative "board"

class TTTTest < Minitest::Test

  def test_print_board_as_table
    board = Board.new
board.draw ==<<EOF
+---+---+---+
| A | B | C |
+---+---+---+

+---+---+---+

+---+---+---+

+---+---+---+
EOF
end



#   def test_print_player_moves
#     board = Board.new [['x','',''],['','o',''],['','','']]
#     output =<<EOF
#   A   B   C
# 1 x |   |
# 2   | o |
# 3   |   |
# EOF
#     puts output
#     assert_equal output, board.to_s
#   end
# end
