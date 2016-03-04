# if you have an array of 3 things, the splat takes the things in an array and separates the into
# 3 seperate objects. You use it for an array of symbols and convert htem into an attr_reader

Argument_list = [:symbol1, :symbol2, :symbol]

attr_reader *Argument_list
