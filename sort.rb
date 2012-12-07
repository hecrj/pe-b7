require 'benchmark'
require './utils'

numbers = []

n = gets

until n.nil? do
  numbers << n.to_i
  n = gets
end

puts "Benchmarking..."
Benchmark.bmbm do |x|
  x.report("sort!") do
    numbers.dup.sort!
  end
end

puts "Finished"
