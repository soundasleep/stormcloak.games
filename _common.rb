def do_exec(s)
  start_time = Time.now
  puts "::group::#{s}" if ENV['CI']
  puts "[#{Time.now}] '#{s}'"
  fail "Could not exec '#{s}'" unless system(s)
  puts "::endgroup::" if ENV['CI']
  end_time = Time.now
  if ENV['CI']
    puts "took #{(end_time - start_time).to_i} sec"
  end
end
