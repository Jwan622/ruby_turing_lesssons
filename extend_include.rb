=begin

include makes it possible to share behaviour through modules by mixing in the methods from a module into a class.
However, include has a limitation: it can only add instance level methods - not class level methods. Lets look at an example:

This won't work (try running seeing is believing)
=end

# module Foo
#   def module_level_method
#     puts "Module level method"  # => nil
#   end
# end
#
# class Bar
#   extend Foo  # => Bar
# end
#
# # Bar.module_level_method      # ~> NoMethodError: undefined method `module_level_method' for Bar:Class
# Bar.module_level_method  # => nil

# As you can see, we receive a NoMethodError when trying to invoke the module level method from the class.
# But there are occasions when you would want to include some methods from a module as class-level methods in a class.
# This is where the method extend becomes useful.
#
# The extend method works similar to include, but unlike include, you can use it to extend ANY object
# by including methods and constants from a module. (I think this means you can extend both classes and instances of classes).

# Check this out

# module Foo
#   def module_method
#     puts "Module Method invoked"  # => nil
#   end
# end
#
# class Bar
# end
#
# bar=Bar.new        # => #<Bar:0x007fa019084f10>
# bar.extend Foo     # => #<Bar:0x007fa019084f10>
# bar.module_method  # => nil

# The above code works even though bar is an instance of the Bar class and not a class. extend works for instances of classes.

=begin
The important thing to note here is that extend works everywhere: inside a class/module definition and
on specific instances. include however cannot be used on specific objects.

In a sense, extend can be used to mimic the functionality of the include method.
Let us discuss this aspect a bit: when you add an include statement inside a class defintion,
Ruby ensures that all new instances of the class will have the methods defined in the included module.


=end



# class Bird
#   def preen
#     puts "I am cleaning my feathersssss."  # => nil
#   end
#   def fly
#     puts "I am flying."                    # => nil
#   end
# end
#
# class Penguin < Bird
#   def fly
#     puts "Sorry. I'd rather swim."         # => nil
#   end
# end
#
# p = Penguin.new      # => #<Penguin:0x007fdb5a0a0ba8>
# t = Pigeon.new       # => #<Pigeon:0x007fdb5a0a0a40>
# p.preen              # => nil
# p.fly                # => nil
# t.fly                # => nil
#
# module Sounds
#   def squawk
#     "squawk squawk"  # => "squawk squawk"
#   end
# end
#
# module Movement
#   def hop
#     "hop hop"    # => "hop hop"
#   end
# end
#
# class Rooster
#   include Sounds  # => Rooster
# end
#
# class Pigeon
#   include Movement  # => Pigeon
# end
#
# rooster = Rooster.new  # => #<Rooster:0x007fc5fa0515a0>
# rooster.squawk         # => "squawk squawk"
# pig = Pigeon.new       # => #<Pigeon:0x007fc5fa051280>
# pig.hop                # => "hop hop"
#
# #Ruby doesn't support multiple inheritance. This is one way to do it.
#
#
# module Sounds
#   def squawk
#     "squawk squawk"  # => "squawk squawk"
#   end
# end
#
# module Movement
#   def hop
#     "hop hop"    # => "hop hop"
#   end
# end
#
# class Rooster
#   include Sounds    # => Rooster
#   include Movement  # => Rooster
# end
#
# roos = Rooster.new  # => #<Rooster:0x007f84e48351d8>
# roos.hop            # => "hop hop"
# roos.squawk         # => "squawk squawk"

# including for a single object

module Sounds
  def squawk
    "squawk squawk"
  end
end

module Movement
  def hop
    "hop hop"    # => "hop hop"
  end
end

class Rooster

end

roos1 = Rooster.new  # => #<Rooster:0x007fd62186b240>
roos2 = Rooster.new  # => #<Rooster:0x007fd62186b088>

roos1 .extend(Movement)  # => #<Rooster:0x007fd62186b240>
roos1.hop               # => "hop hop"
roos2.hop               # ~> NoMethodError: undefined method `hop' for #<Rooster:0x007fd62186b088>

# ~> NoMethodError
# ~> undefined method `hop' for #<Rooster:0x007fd62186b088>
# ~>
# ~> /Users/Jwan/Dropbox/programming/ruby/extend_include.rb:152:in `<main>'
