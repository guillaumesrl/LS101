def after_midnight(time)
  hour_minutes = time.split(":").map(&:to_i)
  minutes = hour_minutes[0]*60 + hour_minutes[1]
  minutes = 0 if minutes == 1440
  minutes

end

def before_midnight(time)
  minutes = 1440 - after_midnight(time)
  minutes = 0 if minutes == 1440
  minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

