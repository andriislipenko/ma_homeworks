puts 'Enter favorite cities:'
favorite_cities = gets.chomp.split(',').map(&:strip)

puts 'Enter hated cities:'
hated_cities = gets.chomp.split(',').map(&:strip)

# For non case-sensitive sorting
asc_string_sort = Proc.new { |a, b| a.downcase <=> b.downcase }
sorted_cities = favorite_cities.sort(&asc_string_sort) + hated_cities.sort(&asc_string_sort)

puts 'Result:'
puts sorted_cities.join(', ')
