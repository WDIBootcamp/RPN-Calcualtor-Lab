require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator

  # Parse should return a list class that you defined, not a ruby array
  def self.parse(rpn_string)
    arr = rpn_string.split(" ")
    list = List.new()
    arr.each { |num| list.push(num) }
    return list
  end

  def self.evaluate(rpn_list)
    stack = Stack.new()
    while rpn_list.length > 0
      char = rpn_list.shift
      if is_number(char)
        stack.push(char.to_f)
      else
        num2 = stack.pop()
        num1 = stack.pop()
        result = num1.send(char, num2)
        stack.push(result)
      end
    end
    return result


  end

  def self.is_operator(operation)
    if operation.match(/[\*\/\+\-\^]/)
      return true
    else
      return false
    end
  end

  def self.is_number(num)
    if num.match(/\d/)
      return true
    else
      return false
    end
  end
end
