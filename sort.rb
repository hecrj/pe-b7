require 'benchmark'
require './utils'

size = ARGV.shift

puts "Generating random array..."
numbers = rand_array(size)

puts "Benchmarking..."
Benchmark.bmbm do |x|
  x.report("sort!") do
    numbers.dup.sort!
  end
end

puts "Finished"
