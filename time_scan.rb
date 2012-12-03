filename = ARGV.shift

contents = File.read(filename)

times = contents.scan(/\(\s(.+?)\)/).flatten
times = times.values_at(* times.each_index.select {|i| i.odd?})
times = times.map { |item| item.to_f * 3 }

puts times