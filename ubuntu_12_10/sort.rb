require 'benchmark'
require './utils'

puts "Generating random array..."
numbers = rand_array(10**7)

puts "Benchmarking..."
Benchmark.bmbm do |x|
  x.report("sort!") do
    numbers.dup.sort!
  end
end

puts "Finished"
