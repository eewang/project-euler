# PROBLEM NUMBER 10

# PROBLEM NAME
# Summation of primes

# PROBLEM DESCRIPTION
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# PROCESS
# => Find all primes below 2 million
  # => Determine prime numbers
  # => Primes are all numbers that are divisible by 1 and itself
# => Add up all primes below 2 million

# ANSWER

# => 142913828922   
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

end

binding.pry