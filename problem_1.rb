# PROBLEM NAME
# Multiples of 3 and 5

# PROBLEM DESCRIPTION
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

# PROCESS
# => Find all numbers below 1000 that are divisible by 3 or 5
# => Sum up all of those numbers

num = 1000
sum = 0

(1..num-1).each do |n|
  if n % 3 == 0 || n % 5 == 0
    sum += n
    puts "#{n}: #{sum}"#
  end
end

