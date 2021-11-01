hash = {
  1    => 2,
  nil  => 3,
 'kEy' => :value_1,
 :key  => :value_2,
  Key:    :value_3
}

keys_count = hash.count { |key, _value| key.to_s.downcase == 'key' }

puts keys_count