require 'csv'
require 'diffy'

benchmark = ARGV[0]
compare = ARGV[1]

benchmark_lines = File.readlines(benchmark).each do |line|
    CSV.read(benchmark)
end

puts benchmark_lines[3]
puts benchmark_lines.count
puts benchmark_lines.class


compare_lines = File.readlines(compare).each do |line|
    CSV.read(compare)
end
puts compare_lines[5]
puts compare_lines.count
puts compare_lines.class


if (benchmark_lines - compare_lines) == 0
    puts "Files #{benchmark_lines} and #{compare_lines} are identical in size"
else
    warn "Difference: #{(benchmark_lines - compare_lines).length}"
end