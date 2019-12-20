def triangle(side1, side2, side3)
  triangle = [side1, side2, side3].sort
  case
  when triangle.include?(0) || triangle[0..1].sum < triangle[2]
    :invalid
  when triangle[0] == triangle[2]
    :equilateral
  when triangle [1] == triangle[2]
    :isosceles
  else
    :scalene
  end
end




puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid