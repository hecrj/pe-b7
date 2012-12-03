require 'benchmark'
require './utils'

puts "Generating random array..."
numbers = rand_array(10**6)
  
puts "Benchmarking..."
Benchmark.bmbm do |x|
  x.report("sin") do
    (10**6).times { |i| Math.sin(numbers[i]) }
    (10**6).times { |i| Math.sin(numbers[i]) }
    (10**6).times { |i| Math.sin(numbers[i]) }
  end
end

puts "Finished"
