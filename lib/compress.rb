# Run-length-encoding is a simple form of data compression:
#   if an element (e) occurs (n) consecutive times in input stream replace the consecutive
#   occurrences with a single pair (ne)
#
# Examples:
#   a    -> 1a
#   aa   -> 2a
#   aabb -> 2a2b
#   abc  -> 1a1b1c

require 'pry'
def compress(input_stream)
  input_stream.chars.chunk(&:itself).map { |x| x.last.count.to_s + x.last[0] }.join
end

compress('aaabc')
