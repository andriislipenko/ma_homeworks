require './image_uploader'

puts 'Enter image url'
url = gets.chomp

ImageUploader.call url

puts 'Do you want to rename file? (y/n)'
answer = gets.chomp.downcase

filename = nil

if answer == 'y'
  puts 'Enter file name'
  filename = gets.chomp
end

ImageUploader.upload(filename)
