# A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.

# A prime D is called a prime divisor of a positive integer P if there exists a positive integer K such that D * K = P. For example, 2 and 5 are prime divisors of 20.

# You are given two positive integers N and M. The goal is to check whether the sets of prime divisors of integers N and M are exactly the same.

# For example, given:

# N = 15 and M = 75, the prime divisors are the same: {3, 5};
# N = 10 and M = 30, the prime divisors aren't the same: {2, 5} is not equal to {2, 3, 5};
# N = 9 and M = 5, the prime divisors aren't the same: {3} is not equal to {5}.
# Write a function:

# def solution(a, b)

# that, given two non-empty arrays A and B of Z integers, returns the number of positions K for which the prime divisors of A[K] and B[K] are exactly the same.

# For example, given:

#     A[0] = 15   B[0] = 75
#     A[1] = 10   B[1] = 30
#     A[2] = 3    B[2] = 5
# the function should return 1, because only one pair (15, 75) has the same set of prime divisors.

# Write an efficient algorithm for the following assumptions:

# Z is an integer within the range [1..6,000];
# each element of arrays A, B is an integer within the range [1..2,147,483,647].


require 'prime'
def gcd(a,b)
  reminder = a%b
  return b if reminder == 0
  gcd b, reminder
end

def solution(a, b)
  primes_gen, primes = Prime::EratosthenesGenerator.new, []
  a.each_with_index.inject(0) do |acc, (n,i)|
    m= b[i]
    d = gcd(n,m)

    0.step do |q| 
      prime = primes[q] || primes[q] = primes_gen.next

       break if d%prime !=0 && ((n%prime==0) ^ (m%prime==0))
       break acc +=1 if d == n && n == m
       d /= prime while d%prime == 0
       n /= prime while n%prime == 0
       m /= prime while m%prime == 0

       break acc +=1 if d==1 && n ==1 && m ==1
       break if d == 1
    end
  acc
  end
end