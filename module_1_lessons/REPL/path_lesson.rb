puts "The dir:                   #{__dir__}"                         # => nil
puts "The file:                  #{__FILE__}"                        # => nil
puts "The c relative to /a/b:    #{File.expand_path("c", "/a/b")}"   # => nil
puts "The c relative to the dir: #{File.expand_path("c", __dir__)}"  # => nil

# >> The dir:                   /Users/Jwan/Dropbox/Turing/Lessons/REPL
# >> The file:                  /Users/Jwan/Dropbox/Turing/Lessons/REPL/path_lesson.rb
# >> The c relative to /a/b:    /a/b/c
# >> The c relative to the dir: /Users/Jwan/Dropbox/Turing/Lessons/REPL/c
