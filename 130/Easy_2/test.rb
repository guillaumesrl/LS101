

def meth(*test)
  yield(test)
end

meth("marg","bosca", "fromage") do |val1, *val|
  p val1
  p val
end