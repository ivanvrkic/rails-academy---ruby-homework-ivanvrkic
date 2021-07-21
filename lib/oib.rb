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

def calculate_control_char
  calculated_control_char = oib.inject(10) do |control_char_sum, digit|
    control_char_sum += digit
    control_char_sum %= 10
    control_char_sum = 10 if control_char_sum.zero?
    control_char_sum *= 2
    control_char_sum % 11
  end
  (11 - calculated_control_char) % 10
end

class Oib
  attr_reader :oib, :control_char

  def initialize(oib)
    raise ArgumentError, 'Code is too short' if oib.length < 11
    raise ArgumentError, 'Code is too long' if oib.length > 11
    raise ArgumentError, 'Code should contain only digits' if oib.scan(/\D/).count.positive?

    @oib = oib.split('').map(&:to_i)
    @control_char = @oib.pop
  end

  def valid?
    calculate_control_char == control_char
  end
end
