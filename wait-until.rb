# Usage:
# ruby wait-until.rb <date> <command>

require_relative "_common"
require "date_core"

date = ARGV[1] or fail "syntax: wait-until.rb -- \"<date>\" \"<command>\""
command = ARGV[2] or fail "syntax: wait-until.rb -- \"<date>\" \"<command>\""

date = DateTime.parse(date) or fail "could not parse '#{date}'"

puts "Waiting until #{date} to run '#{command}'..."

while date > DateTime.now() do
  puts "... (#{DateTime.now()})"
  sleep(5)
end

do_exec command
