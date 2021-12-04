module Accessible
  def attr_accessor(*fields)
    fields.each do |field|
      self.define_method(field) do
        value = self.instance_variable_get("@#{field}")
        puts 'this field is empty' if value.nil?
        value
      end

      self.define_method("#{field}=".to_sym) do |value|
        self.instance_variable_set("@#{field}", value)
      end
    end
  end
end

class Test
  extend Accessible

  attr_accessor :aaa, :bbb, :ccc, :ddd

  def initialize
    @aaa = 5
    @bbb = 'd'
    @ccc = 3
    @ddd = 3
  end
end

test = Test.new
p test.aaa
test.aaa = nil
p test.aaa