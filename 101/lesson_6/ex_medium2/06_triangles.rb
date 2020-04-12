def triangle(ang1, ang2, ang3)
  triangle = [ang1, ang2, ang3].sort
  case
  when triangle.include?(0), triangle.sum != 180
    :invalid
  when triangle.last > 90
    :obtuse
  when triangle.last == 90
    :right
  else
    :acute
  end
end



puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid