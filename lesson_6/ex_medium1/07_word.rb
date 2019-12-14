NUMBERS = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 
           'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

=begin
def word_to_digit(string)
  string.split.map do |value|
    if NUMBERS.include?(value)
      NUMBERS.index(value).to_s
    else
      value
    end
  end.join(' ')
end
=end

def word_to_digit(string)
  NUMBERS.keys.each do |num|
     string.gsub!(/\b#{num}\b/, NUMBERS[num])
  end
end



puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'