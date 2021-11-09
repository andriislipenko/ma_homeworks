def numeric?(input)
  !Float(input).nil? rescue false
end

loop do
  puts "Enter an arbitrary number:"
  input = gets.chomp

  unless numeric?(input)
    puts "Sorry, only numbers are accepted!"
    next
  end

  break if input.count("1") > 1

  puts "Result: #{Float(input).to_i * 256}"
end

puts "You broke the rule"
