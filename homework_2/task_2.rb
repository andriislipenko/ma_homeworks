loop do
  puts "Enter an arbitrary number:"
  input = gets.strip

  unless (/^\d+$/).match?(input)
    puts "Sorry, only numbers are accepted!"
    next
  end

  break if input.count("1") > 1

  puts "Result: #{input.to_i * 256}"
end

puts "You broke the rule"