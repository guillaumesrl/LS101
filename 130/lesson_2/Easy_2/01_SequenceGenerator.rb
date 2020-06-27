

def step(first, last, step)
  counter = first
  loop do
    yield(counter) if block_given?
    counter += step
    break if counter > last
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }