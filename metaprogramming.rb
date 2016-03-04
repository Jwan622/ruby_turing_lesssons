my_object = Object.new

# define a method on my_object to set the instance variable @my_instance_variable
def my_object.set_my_variable=(var)
  @my_instance_variable = var
end

def my_object.get_my_variable
  @my_instance_variable
end
my_object.set_my_variable = "Hello"
puts my_object.get_my_variable


# here are three different approaches to defining the same class methods:

class MyClass
  # defining a class method within the class definition
  def MyClass.capitalize_name
    name.upcase
  end
end

# approach 2
class MyClass;end
# defining a class method out with the class definition
def MyClass.capitalize_name
  name.upcase
end

# approach 3
# define a new class named MyClass
MyClass = Class.new
# add the capitalize_name to MyClass
def MyClass.capitalize_name
  name.upcase
end

=begin
See how similar approach 3 here is to Example 1? You will hopefully have
realised that when you write a class method in Ruby, it’s just the same
as creating an instance of any class and adding methods only to that instance, only this time its an instance of the class “Class”.
=end

=begin
Instead of writing this fuckton of getters and setters:

# Example 5
class CarModel
  def engine_info=(info)
    @engine_info = info
  end

  def engine_info
    @engine_info
  end

  def engine_price=(price)
    @engine_price = price
  end

  def engine_price
    @engine_price
  end

  def wheel_info=(info)
    @wheel_info = info
  end

  def wheel_info
    @wheel_info
  end

  def wheel_price=(price)
    @wheel_price = price
  end

  def wheel_price
    @wheel_price
  end

  def airbag_info=(info)
    @airbag_info = info
  end

  def airbag_info
    @airbag_info
  end

  def airbag_price=(price)
    @airbag_price = price
  end

  def airbag_price
    @airbag_price
  end

  def alarm_info=(info)
    @alarm_info = info
  end

  def alarm_info
    @alarm_info
  end

  def alarm_price=(price)
    @alarm_price = price
  end

  def alarm_price
    @alarm_price
  end

  def stereo_info=(info)
    @stereo_info = info
  end

  def stereo_info
    @stereo_info
  end

  def stereo_price=(price)
    @stereo_price = price
  end

  def stereo_price
    @stereo_price
  end
end

write this instead below:
=end

class CarModel
  FEATURES = ["engine", "wheel", "airbag", "alarm", "stereo"]

  FEATURES.each do |feature|
    define_method("#{feature}_info=") do |info|
      instance_variable_set("@#{feature}_info", info)
    end

    define_method("#{feature}_info") do
      instance_variable_get("@#{feature}_info")
    end

    define_method "#{feature}_price=" do |price|
      instance_variable_set("@#{feature}_price", price)
    end

    define_method("#{feature}_price") do
      instance_variable_get("@#{feature}_price")
    end
  end
end

=begin
so usage of define_method and instance_variable_get/set are the same as this:
=end

# example 7
class CarModel
  attr_accessor :engine_info, :engine_price, :wheel_info, :wheel_price, :airbag_info, :airbag_price, :alarm_info, :alarm_price, :stereo_info, :stereo_price
end

=begin
Great! But this still isn’t ideal. For each feature, we still need to define two
attributes (feature_info and feature_price). Ideally we should be able to call a method that can do the same as in Example 7 but by only listing each feature once.
=end

class CarModel
  # define a class macro for setting features
  def self.features(*args)
    args.each do |feature|
      attr_accessor "#{feature}_price", "#{feature}_info"
    end
  end

  # set _info and _price methods for each of these features
  features :engine, :wheel, :airbag, :alarm, :stereo
end

=begin
 Although this approach is slightly more involved than the one in Example 7,
 it ensures that each feature is treated the same and means that adding more attributes
 in future will be simpler.
=end

class MyGhostClass
  def method_missing(name, *args)
    puts "#{name} was called with arguments: #{args.join(',')}"
  end
end

m = MyGhostClass.new
m.awesome_method("one", "two")

=begin
The major pro is the ability to write code that responds to methods when you
have no way of knowing the names of those methods in advance. The major con is
that changing Ruby’s default behaviour like this may cause unexpected bugs if
you’re not careful with your method names. With that in mind, let’s go back
to our CarModel example and see if we can extend the functionality a little further.
=end

# Example 12
class CarModel
  def method_missing(name, *args)
    name = name.to_s
    super unless name =~ /(_info|_price)=?$/
    if name =~ (/=$/)
      instance_variable_set("@#{name.chop}", args.first)
    else
      instance_variable_get("@#{name}")
    end
  end
end
