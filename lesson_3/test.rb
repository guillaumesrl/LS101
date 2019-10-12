a = 3
b = 1
p a
p a.object_id

1.times do
  p a
  p a.object_id
  b.object_id = a.object_id
end
