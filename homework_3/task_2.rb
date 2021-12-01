class Brackets
  OPENING = ['(', '{', '[', '<']
  CLOSING = [')', '}', ']', '>']

  def initialize(string)
    @string = string
  end

  def valid?
    stack = []

    @string.each_char do |bracket|
      if OPENING.include?(bracket)
        stack << bracket
      else
        pair_index = OPENING.index(stack[-1])

        return false unless pair_index && bracket == CLOSING[pair_index]
        stack.pop
      end
    end

    stack.empty? ? true : false
  end
end

class String
  OPENING = ['(', '{', '[', '<']
  CLOSING = [')', '}', ']', '>']

  def valid?
    stack = []

    self.each_char do |bracket|
      if OPENING.include?(bracket)
        stack << bracket
      else
        pair_index = OPENING.index(stack[-1])

        return false unless pair_index && bracket == CLOSING[pair_index]
        stack.pop
      end
    end

    stack.empty? ? true : false
  end
end