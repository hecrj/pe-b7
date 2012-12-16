# Max number that rand can generate
MAX = 2147483647

# Number of elements to add to next vector
SIZE_JUMP = (10**7) / 50

# Generates a random array of size elements
def rand_array(size)
  # New array of size elements
  numbers = Array.new(size)

  # Fill array with random elements
  numbers.map! { rand(MAX) }

  # Return generated array
  numbers
end

# Do 50 times (50 arrays)
50.times do |t|
  # t is the current iteration, 0 <= t < 50
  # Outputs a message of the current operation
	puts "Generating #{t+1} vector of #{(t+1) * SIZE_JUMP} elements..."

  # Generates an array of (t+1) * SIZE_JUMP elements
	v = rand_array((t+1) * SIZE_JUMP)

  # Creates a new file in vectors/vector_|t|.dat with write permissions
	File.open("vectors/vector_#{format('%02d', t+1)}.dat", "w") do |f|
    # f is the created file
		# Joins each element of the array with a line break and writes the result
    # in the created file 
    f.write(v.join("\n"))
	end
end
