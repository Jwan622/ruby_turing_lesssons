=begin
Ruby has some predefined classes - Exception and its children - that help you to
handle errors that can occur in your program. The following figure shows the
Ruby exception hierarchy.

Which of these happens - dealing with it or aborting the program -
depends on whether you have provided a rescue clause (rescue is a fundamental
part of the Ruby language). If you haven't provided such a clause,
the program terminates; if you have, control flows to the rescue clause.

=end

def raise_exception
  puts 'I am before the raise.'
  raise 'An error has occured'
  puts 'I am after the raise'
end

# the output is:

=begin
> ruby p043raise.rb
I am before the raise.
p043raise.rb:4:in `raise_exception': An error has occured (RuntimeError)
    from p043raise.rb:7
>Exit code: 1
=end


=begin
The raise method is from the Kernel module. By default, raise creates an
exception of the RuntimeError class. To raise an exception of a specific class,
you can pass in the class name as an argument to raise.
=end

def inverse(x)
  raise ArgumentError, 'Argument is not numeric' unless x.is_a? Numeric
  1.0 / x
end
puts inverse(2)
puts inverse('not a number')

=begin
The output is:
>ruby p044inverse.rb
0.5
p044inverse.rb:3:in `inverse': Argument is not numeric (ArgumentError)
    from p044inverse.rb:7
>Exit code: 1
=end

=begin
Remember, methods that act as queries are often named with a trailing ?. is_a?
is a method in the Object class and returns true or false.
The unless modifier when tacked at the end of a normal statement means
execute the preceding expression unless condition is true.
=end

 #Defining new exception classes: To be even more specific about an error, you can define your own Exception subclass:

class NotInvertibleError < StandardError
end

# Handling exceptions

=begin
To do exception handling, we enclose the code that could raise an exception
in a begin-end block and use one or more rescue clauses to tell Ruby the types
of exceptions we want to handle. It is to be noted that the body of a method
definition is an implicit begin-end block; the begin is omitted, and the
entire body of the method is subject to exception handling, ending with the
end of the method.
=end

def raise_and_rescue
  begin
    puts 'I am before the raise.'
    raise 'An error has occured.'
    puts 'I am after the raise.'
  rescue
    puts 'I am rescued.'
  end
  puts 'I am after the begin block.'
end
raise_and_rescue


=begin
Observe that the code interrupted by the exception never gets run.
Once the exception is handled, execution continues immediately after the begin block
that spawned it.
If you write a rescue clause with no parameter list, the parameter defaults to
StandardError. Each rescue clause can specify multiple exceptions to catch.
At the end of each rescue clause you can give Ruby the name of a local variable
to receive the matched exception.
=end

=begin
begin
  # -
rescue OneTypeOfException
  # -
rescue AnotherTypeOfException
  # -
else
  # Other exceptions
end
=end
