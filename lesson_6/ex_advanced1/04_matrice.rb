# def transpose(matrix)
#   size = matrix[0].size
#   length = matrix.size
#   new_arr = []
#   (0..size-1).each do |col|
#     new_row = (0..length-1).map { |row| matrix[row][col] }
#     new_arr << new_row
#   end
#   new_arr
# end

# def transpose(matrix)
#   rows = matrix.size
#   cols = matrix.first.size
#   new_arr = []
#   (0...cols).each do |col|
#     new_col = (0...rows).map { |row| matrix[row][col]}
#     new_arr << new_col
#   end
#   new_arr
# end

def transpose(matrix)
  rows = matrix.size
  cols = matrix.first.size
  new_arr = Array.new(cols) {Array.new(rows)}
  (0...cols).each do |col|
    (0...rows).each do |row|
      new_arr[col][row] = matrix[row][col]
    end
  end
  new_arr
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]


p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]

p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]

p transpose([[1]]) == [[1]]