# Implement a function that counts the number of holes(enclosed spaces) in a number. Use the
# following table as a reference for the number of holes of a specific digit. For example the input
# number 100 should return a result of 2
#
# Digit | Holes
# ------+------
#   0   |   1
#   1   |   0
#   2   |   0
#   3   |   0
#   4   |   1
#   5   |   0
#   6   |   1
#   7   |   0
#   8   |   2
#   9   |   1

require 'pry'
def holes(number)
  h = { 0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 1, 5 => 0, 6 => 1, 7 => 0, 8 => 2, 9 => 1 }
  number.digits.inject(0) { |s, digit| s + h[digit] } # s=s + h[digit]
end

# puts holes(7)
