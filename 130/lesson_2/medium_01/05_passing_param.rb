

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *first, last |
  puts first.join(", ")
  puts  last
end

gather(items) do | first, *sec, last|
  puts first
  puts sec.join(", ")
  puts last
end

gather(items) do | first, *rest|
  puts first
  puts rest.join(", ")
end

gather(items) do |_ , corn , cabbage , wheat|
  puts "#{_}, #{corn}, #{cabbage}, and #{wheat}"
end

gather(items) { |arr| p arr }