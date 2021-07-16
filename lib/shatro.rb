# Implement translator to Satrovacki slang. In order to generate `satro` representation of the word
# translator should split the word on the first vowel, and then reverse the order of split parts. If
# word is (strictly) less than 3 characters long, skip the conversion to `shatro`.
#
# Examples
#   +---------------+---------------+---------------+---------------+
#   |  first vowel  |      split    |    reverse    |     shatro    |
#   +---------------+---------------+---------------+---------------+
#   |     zdravo    |     zdra vo   |     vo zdra   |     vozdra    |
#   |        ^      |               |               |               |
#   +---------------+---------------+---------------+---------------+
#   |    betonske   |   be tonske   |   tonske be   |    tonskebe   |
#   |     ^         |               |               |               |
#   +---------------+---------------+---------------+---------------+
#
# Method will be called with a string which contains series of words separated by a space
# character(eg. "krpa krpa sava sava") and it should return a string where each word is converted to
# Satrovacki slang.
# Bonus points:
# Solve the task in an object-oriented style and meet these conditions:
#   - create a Solution class which accepts the user input
#   - create a Word class which accepts only 1 word and knows how to convert it to shatro
#   - create a Character class which knows if a character is a vowel or not

class Word
  def initialize(word)
    @word = word
  end

  def shatro
    return @word if @word.length < 3

    @word.split(/(?<=[aeiou])/).rotate(1).join('')
  end
end

class Character
  def initialize(char)
    @char = char
  end

  def vowel?
    @char.match?(/[aeiou]/)
  end
end

class Solution
  attr_accessor :sentence

  def initialize
    @sentence = gets
  end
end

def shatro(sentence)
  sentence.split(' ').map { |w| Word.new(w).shatro }.join(' ')
end

# puts Word.new('zdravo').shatro

# puts Character.new('a').vowel?

# puts shatro(Solution.new.sentence)
