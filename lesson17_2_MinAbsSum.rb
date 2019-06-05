# For a given array A of N integers and a sequence S of N integers from the set {−1, 1}, we define val(A, S) as follows:

# val(A, S) = |sum{ A[i]*S[i] for i = 0..N−1 }|

# (Assume that the sum of zero elements equals zero.)

# For a given array A, we are looking for such a sequence S that minimizes val(A,S).

# Write a function:

# def solution(a)

# that, given an array A of N integers, computes the minimum value of val(A,S) from all possible values of val(A,S) for all possible sequences S of N integers from the set {−1, 1}.

# For example, given array:

#   A[0] =  1
#   A[1] =  5
#   A[2] =  2
#   A[3] = -2
# your function should return 0, since for S = [−1, 1, −1, 1], val(A, S) = 0, which is the minimum possible value.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [0..20,000];
# each element of array A is an integer within the range [−100..100].

def solution(a)
  abs = a.map(&:abs)
  max = abs.uniq.max(2).inject(:*).to_i

  init = Hash.new
  init[abs.shift.to_i] = true
  
  abs.inject(init) do |acc, el|
    acc.inject(Hash.new) do |acc_inn, (el_inn, _)|
      candidate1, candidate2 = el_inn + el, (el - el_inn).abs
      acc_inn[candidate1] = true if candidate1 <= max
      acc_inn[candidate2] = true if candidate2 <= max
      acc_inn
    end
  end.keys.min
end