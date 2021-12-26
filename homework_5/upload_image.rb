require './image_uploader'

puts 'Enter image url'
url = gets.chomp

ImageUploader.call url
