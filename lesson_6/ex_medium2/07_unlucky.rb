require 'date'

def friday_13th(year)
  1.upto(12).count { |month| Date.new(year, month, 13).friday? }
end



puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2