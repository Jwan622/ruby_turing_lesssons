class MyApp
  attr_accessor :input, :output

  def initialize
    self.input  = $stdin
    self.output = $stdout
  end

  def prompt_user
    user_selection = input.gets.chomp              # => 'ponies'
    output.puts "User selected: #{user_selection}" # Displays User selected: ponies
    user_selection
  end
end
