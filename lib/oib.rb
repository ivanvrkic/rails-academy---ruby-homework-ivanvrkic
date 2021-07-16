# Implement a class, `Oib`, that represents one OIB number.
#
# On instantiation `Oib` constructor will be called with an oib number(a string). Constructor should
# store the code and perform initial validation of code length and code format(all characters should
# be digits). If any of the preceding constraints are not met, the constructor should raise an
# `ArgumentError` exception with appropriate message:
#   - when the code is shorter than 11 characters, `Code is too short`
#   - when the code is longer than 11 characters, `Code is too long`
#   - when the code contains characters besides digits, `Code should contain only digits`
#
# Oib class should also expose one public method, `Oib#valid?`, which checks whether code satisfies
# mathematical properties for valid OIB number(is control digit correct or not).
#
# Procedure for calculating control code is described in
#   https://regos.hr/app/uploads/2018/07/KONTROLA-OIB-a.pdf
require 'pry'

def calc_control_char(oib)
  control_char = 10
  oib.each do |digit|
    control_char += digit
    control_char %= 10
    control_char = 10 if control_char.zero?
    control_char *= 2
    control_char %= 11
  end
  11 - control_char
end

class Oib
  def initialize(oib)
    raise ArgumentError, 'Code is too short' if oib.length < 11
    raise ArgumentError, 'Code is too long' if oib.length > 11
    raise ArgumentError, 'Code should contain only digits' if oib.scan(/\D/).count.positive?

    @oib = oib
  end

  def valid?
    oib = @oib.split('').map(&:to_i)
    last_char = oib.pop
    control_char = calc_control_char(oib)
    control_char %= 10
    control_char == last_char
  end
end

# puts Oib.new('69435151530').valid?
