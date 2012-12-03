TEST_EXEC = 30

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

  # Obtain test files
  tests = Dir.glob("#{platform}/*.rb")

  # No tests found!
  raise "No tests found for platform: #{platform}" if tests.empty?

  # Perform each test
  tests.each do |test|
    puts "Performing test: #{test}"

    # samples_dir = name of the test without .rb extension
    samples_dir = test.chomp(".rb") + "/"
    Dir.mkdir(samples_dir) unless Dir.exists?(samples_dir)
    
    # Make samples_dir path understandable for the current platform
    samples_path = samples_dir.gsub(File::SEPARATOR, File::ALT_SEPARATOR || File::SEPARATOR)

    # Each test has TEST_EXEC executions
    TEST_EXEC.times do |i|
      puts "Execution #{i+1}..."

      test_ok = system("ruby #{test} > #{samples_path}#{i+1}.out")

      raise "Execution #{i+1} of #{test} failed." unless test_ok
    end

    # Scan and obtain test times
    times_ok = system("ruby #{samples_dir} > #{samples_path}sample.dat")

    raise "Time scanning failed in test: #{test}" unless times_ok
  end

# Exception handling
rescue
  # Show exception message
  puts $!.message

  # Exit with errors
  exit(1)
end
