require './utils'

SIZE_JUMP = (10**7) / 50
50.times do |t|
	puts "Generating #{t+1} vector of #{(t+1) * SIZE_JUMP} elements..."

	v = rand_array((t+1) * SIZE_JUMP)

	f = File.open("vectors/vector_#{format('%02d', t+1)}.dat", "w") do |f|
		f.write(v.join("\n"))
	end
end
