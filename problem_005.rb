# PROBLEM NUMBER 5

# PROBLEM NAME
# Smallest Multiple

# PROBLEM DESCRIPTION
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# PROCESS
# => OPTION 1
  # => Go through each number and test if the modulo for each number 1 to 20 is 0. If yes, then that is the answer. Otherwise, move to the next number
# => OPTION 2
  # => Find the product of the numbers
  # => Find all primes and perfect squares below the max number
  # => Multiply the primes and the square roots of the perfect squares together

# ANSWER
# => 232792560

require 'pry'

class Integer

  def prime?
    prime = true
    if self.even?
      prime = self.even_prime_check
    else
      prime = self.odd_prime_check
    end
    prime
  end

  def odd_prime_check
    prime = true
    divisor = 3
    while prime == true && divisor <= (self**0.5).round(0)
      if self % divisor == 0
        prime = false
      else
        divisor += 1
      end
    end
    prime
  end

  def even_prime_check
    self == 2 ? true : false
  end

  def check_for_primes
    primes = []
    (2..self).each do |i|
      if i.prime?
        primes << i
      end
    end
    primes
  end

  def sum_all_primes
    self.check_for_primes.inject(0) { |result, num| result + num }
  end

  def factor_array
    total_array = self.check_for_primes
    i = 2
    array_add = self.perfect_multiples(i).collect { |n| n ** (1.00/i).to_f }
    total_array << array_add
    total_array
    # factors.inject(1) { |result, num| result * num }
  end

  def factor_array_flatten
    self.factor_array.flatten.inject(1) { |result, num| result * num }.to_i 
  end

  def factor_array_check
    (1..self).each do |i|
      puts "#{self.factor_array_flatten} modulo #{i} is #{self.factor_array_flatten % i}"
    end
  end

  def primes
    self.check_for_primes
  end

  def perfect_multiples(num)
    multiple = (1.00/num).to_f
    multiple_array = []
    (2..self).each do |n|
      if (n ** multiple) % (n ** multiple).floor == 0
        multiple_array << n
      end
    end
    multiple_array
  end

end

puts 20.factor_array_flatten # => 232792560

# binding.pry