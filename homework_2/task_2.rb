loop do
  puts "Enter an arbitrary number:"
  input = gets.chomp

  break if input.count("1") > 1

  puts "Result: #{input.to_i * 256}"
end

puts "You broke the rule"