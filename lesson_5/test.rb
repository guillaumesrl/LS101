def uuid
  format = [8,4,4,4,12,34,5,4,7,1,2,7,434523]
  digits = [*'a'..'z',*'0'..'9']
  uuid = ''
  format.each_with_index do |num, index|
    num.times {uuid << digits.sample}
    uuid << '-' if index < format.size-1
  end
  uuid
end

p uuid
