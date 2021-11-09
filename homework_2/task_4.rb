=begin
  - Із очевидного не повертає Enumerator у випадку відсутності блоку
  - Також map - це метод інстансу класу Array, а даний метод - це метод конкретного об'єкту з конкретним object_id
    (наскільки я зрозумів), тому при присвоєнні змінній нового масиву нічого не працює
=end

arr = %w[a b c d 1 2]
arr += (1..4).to_a

def arr.my_own_map
  collection_counter = 0
  result = []

  if block_given?
    until collection_counter == size
      value = yield(self[collection_counter])
      value *= 2 if value.instance_of?(Integer)

      result << value

      collection_counter += 1
    end
  else
    puts "будьласка додайте блок"
  end

  result
end

p(arr.my_own_map { |item| item })
p(arr.my_own_map { |item| item.to_f })
p(arr.my_own_map { |item| item.to_i })

# Results
#
# ["a", "b", "c", "d", "1", "2", 2, 4, 6, 8]
# [0.0, 0.0, 0.0, 0.0, 1.0, 2.0, 1.0, 2.0, 3.0, 4.0]
# [0, 0, 0, 0, 2, 4, 2, 4, 6, 8]