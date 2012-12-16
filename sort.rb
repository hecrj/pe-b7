require 'benchmark'

# New array
numbers = []

# Gets line from input
n = gets

# Until line is EOF
until n.nil? do
  # Add current line integer to array
  numbers << n.to_i
  # Read next line
  n = gets
end

# Output status message
puts "Benchmarking..."
# Start benchmarking
Benchmark.bmbm do |x|
  x.report("sort!") do
    # Duplicate array and sort == Array#sort
    numbers.dup.sort!
  end
end

# Output status message
puts "Finished"
