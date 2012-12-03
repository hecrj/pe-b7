require 'benchmark'
require './utils'

puts "Generating random arrays..."
a = rand_array(10**7)
b = rand_array(10**7)

puts "Benchmarking..."
Benchmark.bmbm do |x|
  x.report("product") do
    (10**7).times { |i| a[i] * b[i] }
  end
end

puts "Finished"
