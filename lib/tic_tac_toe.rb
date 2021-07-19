# Implement a function which detects the winner of a tic-tac-toe game. The function accepts a single
# argument, a board(represented as an array), with position markers for both players. There are
# three possible values for a marker on board, 'X', 'O' or nil(nobody marked that field). The board
# is encoded as an array of three elements. Each element in the board array represents one row and
# each row contains three elements which represent the columns. The function should return a winner
# marker 'X', 'O', or 'D' in case of a draw (nobody won).
#
# Eg:
#  X | O | X    [ ['X', 'O', 'X'],
# ---+---+---
#    | X | O      [nil, 'X', 'O'],
# ---+---+---
#  X | O |        ['X', 'O', nil] ]
#
#  winner is 'X'

def check_diag1(board)
  (0..2).to_a.each_with_object(Hash.new(0)) do |i, m|
    m[board[i][i]] += 1 unless board[i][i].nil?
  end
end

def check_diag2(board)
  (0..2).each_with_object(Hash.new(0)) do |i, m|
    m[board[i][2 - i]] += 1 if board[i][2 - i]
  end
end

def check_row(board)
  board.each { |row| return row.compact[0] if row.compact.tally.max.last == 3 }
  nil
end

def check_column(board)
  board.transpose.each { |row| return row.compact[0] if row.compact.tally.max.last == 3 }
  nil
end

def tic_tac_toe(board)
  row = check_row(board)
  return row unless row.nil?

  column = check_column(board)
  return column unless column.nil?

  diag1 = check_diag1(board)
  return diag1.max.first if diag1.max.last == 3

  diag2 = check_diag2(board)
  return diag2.max.first if diag2.max.last == 3

  'D'
end

# puts tic_tac_toe([['O', nil, 'X'],
# ['O', 'X', 'O'],
# ['O', 'X', 'O']])
