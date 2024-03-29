# Problem Statement
# Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. 
# The first ten pentagonal numbers are:
# 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
# It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, 
# their difference, 70 − 22 = 48, is not pentagonal.
# Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference 
# are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?
#1.5i**2 - 0.5i
def gen_seq_of_pentagon_numbers(n)
  arr = []
  for i in 1..n
    arr << i*(3*i-1)/2
  end
  arr
end

def nth_term_pentagonal_number(n)
  n*(3*n-1)/2
end

def is_num_pentagonal?(num)
  n = (Math.sqrt((24*num)+1) + 1)/6
  n == n.floor
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  min_D = Float::INFINITY
  min_Pj = 0
  min_Pk = 0
  comparison_range = 10000

  pentagonals = gen_seq_of_pentagon_numbers(30000)
  pentagonals.each_with_index {|num,idx|
    next if idx >= (pentagonals.length - comparison_range - 1)
    for i in (idx+1)..(idx + comparison_range)
      sum = pentagonals[i] + num
      diff = pentagonals[i] - num
      if is_num_pentagonal?(diff) && is_num_pentagonal?(sum)
        # Then test for minimum diff so far
        if diff < min_D
          min_D = diff
          min_Pj = idx + 1 # index if starting from 1
          min_Pk = i + 1   # index if starting from 1
          break
        end
      end
    end
  }

  print "The value of D is #{min_D} \n"
  p "Pj:#{min_Pj} : Pk:#{min_Pk}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The value of D is 5482660 
# "Pj:1020 : Pk:2167"
# Problem computed in 39.52617666199876s