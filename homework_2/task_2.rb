loop do
  puts "Enter an arbitrary number:"
  input = gets.strip

  unless /^-?\d+$/.match?(input)
    puts "Sorry, only numbers are accepted!"
    next
  end

  break if /(1\d*){2,}/.match?(input)

  puts "Result: #{input.to_i * 256}"
end

puts "You broke the rule"
