puts "I am f1"  # => nil

current_dir = File.expand_path(".", __dir__)  # => "/Users/Jwan/Dropbox/Turing/Lessons/REPL"

$LOAD_PATH.unshift(current_dir)  # => ["/Users/Jwan/Dropbox/Turing/Lessons/REPL", "/Users/Jwan/.rvm/gems/ruby-2.1.3/gems/seeing_is_believing-2.1.4/lib", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/x86_64-darwin13.0"]

require 'f2'  # => true

puts __dir__  # => nil

# >> I am f1
# >> loaded f2!
# >> /Users/Jwan/Dropbox/Turing/Lessons/REPL
