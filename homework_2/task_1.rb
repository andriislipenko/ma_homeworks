animals = {
  'котик' => 'няв',
  'песик' => 'гав',
  'свинка' => 'хрю',
  'ластівка' => 'скоро дощ',
  'штріх_з_района' => 'е, слиш, чорт, закурить не найдеться'
}

puts 'Введіть назву тварини:'
input = gets.strip.downcase

if animals.include?(input)
  puts "#{input.capitalize} говорить - #{animals[input]}"
else
  puts 'Введена вами тварина наразі не підтримується'
end