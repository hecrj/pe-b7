samples_dir = ARGV.shift
samples = Dir.glob("#{samples_dir}/*.out")
samples.sort!

puts samples_dir

samples.each do |sample|
  contents = File.read(sample)

  times = contents.scan(/\(\s(.+?)\)/).flatten
  times = times.values_at(* times.each_index.select {|i| i.odd?})

  puts times[0]
end
