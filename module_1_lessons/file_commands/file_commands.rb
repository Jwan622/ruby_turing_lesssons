=begin
It's good to know the difference between these two lines of code:
File.expand_path('../..', __FILE__)

File.expand_path('../Gemfile', File.dirname(__FILE__))

explanation here:
http://stackoverflow.com/questions/4474918/file-expand-path-gemfile-file-how-does-this-work-where-is-the-fil

=end
# puts File.dirname(__FILE__)                       # => nil
# $LOAD_PATH << File.dirname(__FILE__)              # => ["/Users/Jwan/.rvm/gems/ruby-2.1.3/gems/seeing_is_believing-2.1.4/lib", "/Users/Jwan/.rvm/gems/ruby-2.1.3/extensions/x86_64-darwin-13/2.1.0/json-1.8.3", "/Users/Jwan/.rvm/gems/ruby-2.1.3/gems/json-1.8.3/lib", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/Dropbox/programming/ruby/module_1_lessons/file_commands"]
# puts $LOAD_PATH.include?(File.dirname(__FILE__))  # => nil
# puts("require: #{require('test_file')}")

# puts ("require_relative: #{require_relative?('../file_commands/test_file')}")  # ~> NoMethodError: undefined method `require_relative?' for main:Object
# puts ("require: #{require('./test_file')}")       # ~> LoadError: cannot load such file -- ./test_file
# puts ("This is __FILE__: #{__FILE__}")
# puts ("This is File.expand_path 1: #{File.expand_path(__FILE__)}")
# puts ("This is File.expand_path('../..', __FILE__): #{File.expand_path('../..', __FILE__)}")
# puts ("This is File.dirname(__FILE__): #{File.dirname(__FILE__)}")
# puts ("This is File.expand_path('../..', File.dirname(__FILE__)): #{File.expand_path('../..', File.dirname(__FILE__))}")

# ~> LoadError
# ~> cannot load such file -- ./test_file
# ~>
# ~> /Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/Jwan/Dropbox/programming/ruby/module_1_lessons/file_commands/file_commands.rb:14:in `<main>'
