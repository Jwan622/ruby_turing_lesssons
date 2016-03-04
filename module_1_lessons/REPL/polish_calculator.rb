class Polish_calculator
  def math_eval(number1, number2)
    if symbol == "+"
      answer = number1 + number2
      answer
    elsif symbol == "-"
      answer = number1 - number2
      answer
    elsif symbol == "/"
      answer = 0
      while number1 < number2
        number1 - number2
        answer += 1
      end
      answer
    elsif symbol == "*"
      answer = 0
      while number2 != 0
        answer = number1 + number1
        number2 -= 1
      end
      answer
    else
      puts "you suck at inputting numbers and symbols."
    end
  end
end

loop do
  print "> "
  number1 = gets.to_i
  number2 = gets.to_i
  answer  = math_eval(number1, number2)
  puts(answer.inspect)
end

polish_calculator("/", 10, 5)


def test_it_can_add
  calc = PrefixCalculator.new
  answer = calc.execute("+ 3 4")
  assert_equal 7, answer
end


require <complicate class>
puts "Enter your calculation:"
input = ""
calc = PrefixCalcualtor.new

while input != "q"
  print "< "
  input = gets.chomp
  puts calc.execute(input)
end

puts "Seeya!"
