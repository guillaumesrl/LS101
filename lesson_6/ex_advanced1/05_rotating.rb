# def rotate90(matrix)
#   row_numbers = matrix.size
#   col_numbers = matrix.first.size
#   new_matrix = []
#   (0...col_numbers).each do |col|
#     row = (0...row_numbers).to_a.reverse.map { |row| matrix[row][col]}
#     new_matrix << row
#   end
#   new_matrix
# end

def rotate90(matrix)
  rows = matrix.size
  cols = matrix.first.size
  new_arr = Array.new(cols) {Array.new(rows)}
  (0...cols).each do |col|
    (0...rows).to_a.reverse.each do |row|
      new_arr[col][row] = matrix[row][col]
    end
  end
  new_arr
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2