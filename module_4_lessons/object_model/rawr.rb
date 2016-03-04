# Run these with `command + option + n`, NOT `b`


# =====  Toplevel methods are defined where?  =====
def rawr!
  "#{self} says: rawr!"
end
public :rawr!            # => Object

# *****
# What class is rawr! defined in
method(:rawr!).owner  # => Object

# *****
# Think of some objects that inherit from this class
# and show you can call it on them
self.methods.include?(:method)  # => true
method(:rawr!).owner            # => Object
self.methods                    # => [:to_s, :inspect, :rawr!, :to_json, :nil?, :===, :=~, :!~, :eql?, :hash, :<=>, :class, :singleton_class, :clone, :dup, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :freeze, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :extend, :display, :method, :public_method, :singleton_method, :define_singleton_method, :object_id, :to_enum, :enum_for, :==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__]
self.method(:hash).owner        # => Kernel
self.method(:inspect).owner     # => #<Class:#<Object:0x007fd7c08123e8>>
(:symbols).class.superclass     # => Object


# =====  What do bindings tell us?  =====

# Here we have a method that returns an object wrapping the binding it executed in
# We can evaluate code within the context of that binding to find out about it
def get_binding
  a = 123        # => 123
  binding        # => #<Binding:0x007fd7c087add0>
end
b = get_binding  # => #<Binding:0x007fd7c087add0>

# *****
# What is self in that binding?
b.eval 'self'  # => main

# *****
# What are its local variables?
b.eval 'local_variables'  # => [:a]

# *****
# What is the value of a?
a = 99      # => 99
b.eval 'a'  # => 123

# *****
# The binding tracks what `self` is, why does this matter?
# What will we see the second time we run this?
b.eval 'instance_variables'  # => []
@abc = 123                   # => 123
b.eval 'instance_variables'  # => [:@abc]


# =====  Calling methods pushes bindings onto the callstack  =====
# We can see the callstack with the `caller` method.
def you_rang?
  # *****
  puts caller  # => nil
  # How many bindings are on the callstack?
  caller.size  # => 1

  # *****
  # Where did we call it from?
  caller   # => ["/Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:68:in `<main>'"]
end
you_rang?  # => ["/Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:68:in `<main>'"]

# *****
# What will we see, before and after the calls of each of these lines below?
def call1
  caller       # => ["/Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:98:in `<main>'"]
  caller.size  # => 1
  call2        # => 2
  caller.size  # => 1
end

def call2
  caller.size  # => 2
  call3        # => 3
  caller.size  # => 2
end

def call3
  caller.size   # => 3
  "zomg".call4  # => 4
  caller.size   # => 3
end

class String
  def call4
    caller.size  # => 4
  end
end

caller.size  # => 0
call1        # => 1
caller.size  # => 0

# =====  The last line of a method is returned to the caller  =====

# *****
# What will we see returned from call1?
def call1
  call2    # => 222
  call3    # => 333
end

def call2
  222      # => 222
end

def call3
  call4    # => 444
  333      # => 333
end

def call4
  444      # => 444
end

call1  # => 333


# =====  Arguments are evaluated first  =====
# Each of the expressions below will evaluate its argument first,
# then it will evaluate itself. What will we see on eac line?

def call1(n)
  caller      # => ["/Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:151:in `<main>'"]
  n           # => 0
  1 + n       # => 1
end

def call2(n)
  caller       # => ["/Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:150:in `<main>'"]
  puts caller  # => nil
  n            # => 1
  n + 2        # => 3
end

def call3(n)
  caller      # => ["/Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:149:in `<main>'"]
  n           # => 3
  n + 3       # => 6
end

call3(
  call2(
    call1(0)  # => 1
  )           # => 3
)             # => 6


# =====  Instance Variables  =====
# An instance is a collection of instance variables with a pointer to its class,
# it is like the base of a linked list, pointing at the first node in the list
# (typically named "head")

# What will we see returned from 159?
class Fruit
  def initialize(banana)
    @apple = banana            # => "orange"
    @pear  = "#{banana} boat"  # => "orange boat"
  end

  def pear
    @apple  # => "orange"
  end
end

fruit = Fruit.new('orange')  # => #<Fruit:0x007fd7c08712d0 @apple="orange", @pear="orange boat">
fruit.pear                   # => "orange"
fruit.class                  # => Fruit


# =====  Attr Whatevers  =====
# The attr_accessor (et all) define define methods that get/set the instance variables of the same name
class Fruit
  attr_accessor :apple  # => nil

  def initialize(banana)
    @apple = banana                # => "orange"
    self.apple = "#{banana} boat"  # => "orange boat"
  end

  def pear
    @apple  # => "orange boat", "pineapple", "mango"
  end
end

#*****
# What will we see on these two lines?
fruit = Fruit.new('orange')  # => #<Fruit:0x007fd7c0870650 @apple="orange boat">
fruit.pear                   # => "orange boat"
fruit.apple                  # => "orange boat"
fruit.apple.class            # => String

# *****
# We can punch the object in the face and rearrange its guts with metaprogramming
# Here, I go into it and set @apple = 'pineapple'
# What will we see in the following expressions?
fruit.instance_variable_set '@apple', 'pineapple'  # => "pineapple"
fruit.pear                                         # => "pineapple"
fruit.apple                                        # => "pineapple"

fruit.apple = 'mango'  # => "mango"
fruit.pear             # => "mango"
fruit.apple            # => "mango"


# ===== Classes are a linked list called inheritance  =====
# Get classy, stay super

class A
  def zomg
    'a'     # => "a", "a"
  end
end

class B < A
  def zomg
    'b'      # => "b", "b"
  end
end

class C < B
end

class D < A
end

# *****
# What will we see on each of these lines?
A.new.zomg    # => "a"
B.class       # => Class
B.superclass  # => A
B.new.zomg    # => "b"
C.new.zomg    # => "b"
D.new.zomg    # => "a"

# =====  We can use super to access the definition in the superclass chain  =====
class C1
  def m
    '1'
  end
end

class C2 < C1
  def m
    super + '2'
  end
end

class C3 < C2
  def m
    super + '3'
  end
end

# *****
# What will we see on each of these lines?
# C1.new.m # =>
# C2.new.m # =>
# C3.new.m # =>


# =====  Once again, but with malice  =====
class W
  def zomg() '1' + wtf  end
  def wtf()  '2'        end
  def bbq()  '3'        end
end

class X < W
  def zomg() super      end
  def wtf()  '4' + bbq  end
  def bbq()  super      end
end

class Y < X
  def zomg() '6' + super  end
  def wtf()  '7' + super  end
  def bbq()  '8' + super  end
end

#*****
# W.new.zomg # =>
# X.new.zomg # =>
# Y.new.zomg # =>


# =====  Chaining method calls  =====
# When we call a method, we call it on whatever the expression evaluates to
# This means that chaining methods leads to methods called on the return value of the previous expression

#*****
# What will this expression evaluate to?
# 'abc'.upcase.reverse.downcase.chars.first # =>

#*****
# It doesn't matter if you split the expression across lines, what will we see?
# 'abc'       # =>
#   .upcase   # =>
#   .reverse  # =>
#   .downcase # =>
#   .chars    # =>
#   .first    # =>

#*****
# The dot can go on the preceeding line, or the current line
# 'abc'.      # =>
#   upcase.   # =>
#   reverse.  # =>
#   downcase. # =>
#   chars.    # =>
#   first     # =>

#*****
# We can get all funky with the dot (best practices, ya know?)
# 'abc'.              # =>
#   upcase  .reverse  # =>
#   .downcase.        # =>
#   chars             # =>
# .  first            # =>


# =====  Mixing and matching args and chaining  =====
#*****
# Uncomment each of the following lines, what will we see?
def z(a)
  # a + a # =>
end

def w(a)
  # a         # =>
  #  .reverse # =>
end

# (w (z 'abc').upcase).chars # =>


# =====  Modules  =====
# When you include a module, it makes a class and inserts it into the hierarchy
class A
  def wat
    'a'
  end
end

module WatInTheWorld
  def wat
    '!?' + super
  end
end

class B < A
  include WatInTheWorld  # => B
  def wat
    'b' + super
  end
end

#*****
# What will we see here?
# B.new.wat # =>


# =====  Silence!! DEstroy him!!  =====
# Dew! Bew! Dew-dew-dew! Bew!

module InSpace
  attr_reader :current_status               # => nil
  def initialize(current_status, *whatevz)
    @current_status = current_status        # => "Though one thing we have in common with the present is we still call it the present, even though its the future"
    super(*whatevz)                         # => "What you call 'the present', we call 'the past', so... you guys are way behind"
  end
end

class Human
  attr_reader :name     # => nil
  def initialize(name)
    @name = name        # => "What you call 'the present', we call 'the past', so... you guys are way behind"
  end
end

class Student < Human
  include InSpace               # => Student
  attr_reader :lesson           # => nil
  def initialize(lesson, *o_O)
    @lesson = lesson            # => "The future is quite different to the present"
    super *o_O                  # => "What you call 'the present', we call 'the past', so... you guys are way behind"
  end
end

students_in_space = Student.new(                                                                                      # => Student
  "The future is quite different to the present",                                                                     # => "The future is quite different to the present"
  "Though one thing we have in common with the present is we still call it the present, even though its the future",  # => "Though one thing we have in common with the present is we still call it the present, even though its the future"
  "What you call 'the present', we call 'the past', so... you guys are way behind"                                    # => "What you call 'the present', we call 'the past', so... you guys are way behind"
)                                                                                                                     # => #<Student:0x007fd7c0868900 @lesson="The future is quite different to the present", @current_status="Though one thing we have in common with the present is we still call it the present, even though its the future", @name="What you call 'the present', we call 'the past', so... you guys are way behind">

#*****
# We used poisonous gasses, (with traces of lead)
# and we poisoned their asses (actually, their lungs)
# students_in_space.current_status # =>
# students_in_space.name           # =>
# students_in_space.lesson         # =>

# >> /Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:68:in `<main>'
# >> /Users/Jwan/Dropbox/Turing/module_4_lessons/object_model/rawr.rb:150:in `<main>'
