MAX = 2147483647

def rand_array(size)
  numbers = Array.new(size)
  numbers.map! { rand(MAX) }

  numbers
end
