if(ARGV.size < 1)
  puts "Usage: test [PLATFORM]"
  puts
  puts "Description:"
  puts "Perform some Ruby performance tests in your platform."

  exit(0)
end

begin
  # Platform to test is the first argument
  platform = ARGV.shift

  # Create dir for platform
  Dir.mkdir(platform) unless Dir.exists?(platform)

  vectors = Dir.glob("vectors/*.dat") # Select array filenames
  vectors.sort! # Sort array filenames

  raise "No vectors found." if vectors.empty?

  vectors.each do |v|
    # v is each array filename
    puts "Sorting #{v}..."

    filename = File.basename(v, ".dat") # Extracts filename extension
	  next if File.exists?("#{platform}/#{filename}.out")
    
    vector_path = v.gsub!(File::SEPARATOR, File::ALT_SEPARATOR || File::SEPARATOR)

    sample_path = "#{platform}/#{filename}.out"
    sample_path.gsub!(File::SEPARATOR, File::ALT_SEPARATOR || File::SEPARATOR)

    # Execute sort.rb in an isolated process
    test_ok = system("ruby sort.rb < #{vector_path} > #{sample_path}")

    raise "Sorting of #{v} failed." unless test_ok
  end

# Exception handling
rescue
  # Show exception message
  puts $!.message
  # Exit with errors
  exit(1)
end
