require "httparty"
Dir[File.dirname(__FILE__) + '/dish/*.rb'].each do |file|
  require file
end

puts __FILE__
puts File.dirname(__FILE__)
puts File.dirname(__FILE__) + '/dish/*.rb'
puts Dir[File.dirname(__FILE__) + '/dish/*.rb']

# >> /Users/Jwan/Dropbox/programming/ruby/module_4_lessons/gems/dribble/lib/dish.rb
# >> /Users/Jwan/Dropbox/programming/ruby/module_4_lessons/gems/dribble/lib
# >> /Users/Jwan/Dropbox/programming/ruby/module_4_lessons/gems/dribble/lib/dish/*.rb
# >> /Users/Jwan/Dropbox/programming/ruby/module_4_lessons/gems/dribble/lib/dish/version.rb
