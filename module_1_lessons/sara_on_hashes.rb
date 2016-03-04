=begin
This odd looking =begin thing is how you start multi-line comments in ruby.
You can start a bunch of comments (non-running code that exists
just to inform the programmer or reader what the hell you're talking about) in Ruby
using the =begin and =end syntax. This comment will end on this next line.


# You can also start comments using this # symbol. There are multiple ways to do things. Sweet huh?

# So this is a quick tutorial on hashes. Run this file using terminal or a command prompt.
# First use the "cd" command to switch into the directory where this file exists.
# You can then run this file by typing ruby on_hashes.rb assuming you have a ruby
# installed. If this step doesn't work, then either your ruby isn't installed or you're in the wrong file
# directory. Both problems are hella annoying, but you can experiment a bit. These
# two steps may help you debug. If you know how to run files already and you find
# this explanation stupid, scroll down to the code and ignore this.
# 1. if you CAN "cd" into directories, make sure you're in the right directory.
# 2. if you CANNOT "cd" into the directory because you have a windows machine or something
#    then perhaps try typing "ruby", then a space, and then the entire file path of the file (it probably is something like:
#    c:/sara/(some folder structure)/on_hashes.rb). If this doesn't work, show me this next time and I'll try to help!


# here's a sample hash
sample_hash = {"sara": 28, "occupation": "phd candidate", "eyes": "sky blue", "talents": "doling out fake phone numbers to men", "origin": "brooklyn/syria"}

# think of hashes as a word dictionary... a thing that stores key-value pairs and you can use it
# to look up the value of a key when needed. Order is of secondary importance in a hash unlike an array.
# You often use it when you need to associate relationships between specific attributes and values...
# or keys and values...like above! Describing people, places, objects like a notebook, or a store might be a way to
# use one. In real life, I had to build an application once that had descriptions of plane tickets.
# Each ticket had a destination, price, airport, starting airport, destination city, arrival city, upgradeability, etc.
# Using an array would be weird since it could only
# store values and wouldn't really do the job I needed. I needed this ticket to have a price of $400 or like a destination city: "San jose" or
# descriptions like that. Ultimate the ticket looked something like this:
# san_jose_ticket = {price: 400, destination_city: san_jose, arrival_airport: "SAJ", fee: $50...} whereas this would be less useful:
# san_jose_ticket = [400, "san_jose", "SAJ", 50]
# why is it less useful? Well how would I consistently remember in a large application which number is the price?

# Here's one way to iterate through a hash. This code below will iterate through the sample_hash that I
# created above.

sample_hash.each do |key, value|
  print "this is the key of the current key-value pair: "
  puts "#{key}"
  print "this is the value of the current key-value pair "
  puts "#{value}"
end

# if you just want the keys of the hash, ruby gives you a nice convenience method that you can
# call on the hash object. The method keys will return you an array of the hash's keys.

print "this is what you can get when you call .keys on a hash: "
p sample_hash.keys
print "calling .keys on a hash returns you an object of type: "
puts sample_hash.keys.class

# so when we iterate over sample_hash.keys we're actually iterating over an array. Let's do that!
sample_hash.keys.each do |key|
  puts "#{key}"
end

# this is some bonus stuff about arrays. If you're still awake... here's a quick lesson!

# there are a couple of quick easy ways to iterate over an array. Not we're talking about arrays, not hashes.
# if you use .each, it will iterate over an array... loop through the array one by one which will then allow you to do
# something to each element in the array. Here's an array with 5 elements:

sample_array = [5,3,"hi", "I am a string too", :this_is_a_symbol]

# when you call .each on a sample_array it will always return you the original sample array no matter what you do to the actual array.

return_value = sample_array.each do |element|
  puts "It doens't matter that I'm outputting this array to console. The each method will only return the original array"
end

# the function p btw prints out the literal, the value converted to a string, value of the object it is meant to print out.
p return_value

# However, .map will return you a new array in which each element is the return value of the block... the chunk of code in between
# the do and the end. And rememeber, in ruby the return value of a block is the last fully executable line of code.

sample_array = [1,2,3,4,5]
return_value_of_map = sample_array.map do |element|
  element + 1
end

# In the above code, we're looping through each element and incrementing each element by 1. The return value of the block
# is element + 1 and so we should expect our return value to be an array with the elements [2,3,4,5,6]
# run this file in console and see what you get!

p return_value_of_map
=end

def jeff_traits
  {
  :basic_info => {
    :name => "Jeff",
    :age => "29",
    :occupation => ["international man of mystery", "coder"],
    :eyes => ["deep brown", "lovely"],
    :origin => ["Shaolin", "China/Taiwan"],
    },
  :talents => {
    :survived => ["malaria 3 times", "slammed to the ground and asked for a bribe by cops", "hunter HS debate team"],
    :other => ["writing code tutorials really fast", "forgiving typos which cause unintended consequences"],
    },
  :attributes => {
    :personality => ["chatty", "extroverted", "curious"],
    :looks => "real cute"
    }
  }
end

def start
    user_input = obtain_user_response
    jeff_method.each do |category, data|
      if user_input.to_sym == category
        Messages.follow_up_question
        data.each do |trait, specific_data|
          puts trait
        end
      end
    end
  user_input2=gets.chomp

  jeff_method.each do |category, data|
    if user_input.to_sym == category
      data.each do |trait, specific_data|
        if user_input2.to_sym == trait
          puts "Here are Jeff's traits under #{user_input}, #{user_input2}:"
            puts specific_data
        end
      end
    end
  end
end

def obtain_user_response
  gets.chomp
end

=begin
Single responsibility action. I am extracted out the Messages class. While this should seem
weird and almost stupid to do... it's a good habit to get into early because it is such a useful thing to do
in larger applications.
=end

class Messages
  def self.intro_question
    puts "what would you like to know about Jeff? You can type: 'basic_info', 'talents', or 'attributes'."
  end

  def self.follow_up_question
    puts "Great. Now, within that category, what would you like to know? You can type"
  end
end

traits
