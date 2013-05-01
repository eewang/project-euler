# PROBLEM NUMBER 7

# PROBLEM NAME
# 10001st prime

# PROBLEM DESCRIPTION
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

# PROCESS
# => I want to be able to determine a prime number by passing in the index for it within the prime number universe
# => Find the pattern of determining prime numbers
  # => Look at factors for determining a prime number

# ANSWER

# => 104743

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

  def which_prime?
    self.check_for_primes.size
  end

  def self.prime_search(*searches)
    searches.each do |search|
      define_method "#{search}_prime" do
        prime_test = self
        case search
        when :next
          prime_test += 1 if self.prime?
          prime_test += 1 until prime_test.prime?
        when :previous
          prime_test -= 1 if self.prime?
          prime_test -= 1 until prime_test.prime?
        end
        prime_test
      end
    end 
  end

  prime_search :next, :previous

  def find_prime(index)
    if self.prime?
      starting_prime = self
    else
      starting_prime = self.previous_prime
    end
    puts "#{starting_prime.which_prime?} prime: #{starting_prime}"
    starting_index = starting_prime.which_prime?
    move_to_next_prime(starting_prime, starting_index, index)
  end

  def move_to_next_prime(start_prime, start_index, target_index)
    case 
    when start_index == target_index
      start_prime
    when start_index < target_index
      next_num = start_prime.next_prime
      next_num.find_prime(target_index)
    when start_index > target_index
      next_num = start_prime.previous_prime
      next_num.find_prime(target_index)
    end
  end

end

binding.pry
