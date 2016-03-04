# def repl(instream, outstream)
#   loop do
#     #read
#
#     #print prompt
#     outstream.print "> " #print to whatever local variable outstream is pointing at
#
#     # read
#     input = instream.gets
#
#     #eval
#     result = eval(input)
#
#     #print
#     outstream.puts(result.inspect)
#
#     #loop
#   end
# end
# repl($stdin, $stdout)

#
# def get_next_line
#   line1 = gets
#   line2 = $stdin.gets
#   puts "FIRST  LINE IS: #{line1}"
#   puts "SECOND LINE IS: #{line2}"
# end
# require 'pry'
# binding.pry

#
# def get_next_line_from(stream)
#   line = stream.gets
#   puts "LINE IS: #{line}"
# end
# require 'pry'
# binding.pry

#
# def upcase_the_input
#   input = gets
#   input.upcase
# end
# require "pry"
# binding.pry

#
# def upcase_the_input(stream)
#   input = stream.gets
#   input.upcase
# end
# require "pry"
# binding.pry


def repl(input_stream, output_stream)
  loop do
    output_stream.print "> "
    input  = input_stream.gets()
    result = binding.eval(input)
    output_stream.puts(result)
  end
end
