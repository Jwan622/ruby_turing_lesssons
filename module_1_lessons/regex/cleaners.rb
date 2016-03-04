class Cleaners
  def domain_from_email(email_address)
    email_address.match(/@/).post_match  # => "gmail.com"
  end

  def area_code_only(phone_number)
    phone_number.gsub(/[\+()]/, "")      # => "1555 456-7890"

  end


  def get_secret_message(string)
    string.match(/[^a-zA-Z]/)            # => #<MatchData "%">

  end


end



cleaner = Cleaners.new                                                                 # => #<Cleaners:0x007faefb0d7828>
puts cleaner.domain_from_email("Jwan622@gmail.com")                                    # => nil
puts cleaner.area_code_only("+1(555) 456-7890") == "555"                               # => nil
puts cleaner.get_secret_message("h%%&e__re *iS a 9#se)cr<e!!T") == "here is a secret"  # => nil

# >> gmail.com
# >> false
# >> false
