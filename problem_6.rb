# PROBLEM NUMBER 6

# PROBLEM NAME
# Sum square difference

# PROBLEM DESCRIPTION

# The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# PROCESS

# => Find the sum of the squares of the first 100 numbers
# => Find the square of the sum of the first 100 numbers
# => Subtract the two numbers

# ANSWER
# 25164150

require 'pry'

# PROCESS 1

# num = 100
# square_array = []
# square_result = 0
# sum_array = []
# sum_result = 0

# (1..num).each do |i|
#   square_array << i**2
#   square_result = square_array.inject(0) { |result, num| result + num}
# end

# sum_result = ((1..num).inject(0) { |result, num| result + num })**2

# answer = (sum_result - square_result).abs

# PROCESS 2

class Integer

  def calculate_square_sums
    square_array = []
    (1..self).each do |i|
      square_array << i**2
    end
    square_array.inject(0) { |result, num| result + num}
  end

  def calculate_sum_squares
    ((1..self).inject(0) { |result, num| result + num })**2
  end

  def calculate_difference
    (self.calculate_sum_squares - self.calculate_square_sums).abs
  end

end

100.calculate_difference

binding.pry