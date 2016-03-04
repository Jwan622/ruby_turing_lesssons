module Vehicular
  def move_forward(n)
    @position += n
  end
end

class Vehicle
  include Vehicular  # Adds Vehicular to the lookup path
end

class Car < Vehicle
  attr_reader :position

  def initialize
    @position = 0
  end

  def move_forward(n)
    puts "Vrooom!"
    super
  end
end

car = Car.new
car.move_forward(2)
car.position
# car position is increased because Vehicular#move_forward gets called
car.move_forward(3)
car.position


# A common use of inheritance is to have overridden methods in a subclass do something in addition
# to what the superclass method did, rather than something entirely different (like in previous examples).
# This allows us to re-use behaviour that exists in a superclass, then modify to suit the needs of the subclass.
# Most object oriented languages offer a mechanism by which an overridden method can be called
# by the overriding method. Ruby uses the super keyword to make this happen. Using
# super will call the same method, but as defined in the superclass and give you the result.

# this is a cool example of super. Basically super calls the the overridden method inside the overriding method
#
# class Animal
#   def move
#     "I can move"  # => "I can move", "I can move"
#   end
# end
#
# class Bird < Animal
#   def move
#     super + " by flying"  # => "I can move by flying"
#   end
# end
#
# puts Animal.new.move  # => nil
# puts Bird.new.move    # => nil
