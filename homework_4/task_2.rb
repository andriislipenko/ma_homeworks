module Sortable
  def sort_by(arr, field, asc = true)
    failed = []

    arr.sort! do |first, second|
      first, second = second, first unless asc

      if first.respond_to?(field) && second.respond_to?(field)
        next compare_values(first.send(field), second.send(field))
      end

      [first, second].each { |element| failed << element unless test_response(element, field) }
      next 0
    end

    puts "Failed: #{failed.to_s}"
    arr.difference failed
  end

  private

  def compare_values(first, second)
    return -1 if first.nil? || first == false
    return 1 if second.nil? || second == false
    first <=> second
  end

  def test_response(element, field)
    unless element.respond_to?(field)
      puts "#{element.inspect} does not respond to #{field}"
      return false
    end
    true
  end
end