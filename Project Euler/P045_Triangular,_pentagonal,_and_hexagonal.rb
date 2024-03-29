# Problem Statement
# Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
# Triangle 	     	Tn=n(n+1)/2 	  	1, 3,  6, 10, 15, ...
# Pentagonal 	  	Pn=n(3n−1)/2 	  	1, 5, 12, 22, 35, ...
# Hexagonal 	  	Hn=n(2n−1) 	  	  1, 6, 15, 28, 45, ...

# It can be verified that T285 = P165 = H143 = 40755. 

# Find the next triangle number that is also pentagonal and hexagonal.
def gen_seq_of_pentagon_numbers(n)
  arr = []
  for i in 1..n
    arr << i*(3*i-1)/2
  end
  arr
end

def gen_seq_of_triangle_numbers(n)
  arr = []
  for i in 1..n
    arr << ((i+1)*0.5*i).to_i
  end
  arr
end

def gen_seq_of_hexagon_numbers(n)
  arr = []
  for i in 1..n
    arr << i*(2*i - 1)
  end
  arr
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Since all hexagonal numbers ARE triangle numbers, we skip triangle numbers
  arr_pentagonals = gen_seq_of_pentagon_numbers(100000)
  arr_hexagonals  = gen_seq_of_hexagon_numbers(100000)

  intersection = arr_pentagonals & arr_hexagonals

  print "The next triangle number after 40755 is #{intersection[2]} \n"
  p intersection

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The next triangle number after 40755 is 1533776805 
# [1, 40755, 1533776805]
# Problem computed in 0.03252853599997252s