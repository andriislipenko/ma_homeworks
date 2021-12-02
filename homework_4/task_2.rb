module Sortable
  def sort_by(arr, field, asc = true)
    failed = []

    arr.sort! do |first, second|
      first, second = second, first unless asc

      if first.respond_to?(field) && second.respond_to?(field)
        first_value = first.send(field)
        second_value = second.send(field)

        next -1 if first_value.nil? || first_value == false
        next 1 if second_value.nil? || second_value == false
        next first_value <=> second_value
      end

      [first, second].each do |element|
        unless element.respond_to?(field)
          puts "#{element.inspect} does not respond to #{field}"
          failed << element
        end
      end

      next 0
    end

    puts failed.to_s
    arr.difference failed
  end
end