# def transpose(matrix)
#   new_matrix = Array.new(3) {Array.new(3)}
#   0.upto(2) do |arr|
#     0.upto(2) do |index|
#       new_matrix[arr][index] = matrix[index][arr]
#     end
#   end
#   new_matrix
# end

# def transpose!(matrix)
#   0.upto(2) do |col|
#     0.upto(2) do |row|
#       matrix[col][row], matrix[row][col] = matrix[row][col], matrix[col][row]
#     end
#   end
#   p matrix
# end


# def transpose(matrix)
#   new_arr = []
#   rows = matrix.size
#   col = matrix.first.size
#   (0...col).each do |col|
#     row = (0...row).map { |row| matriw[col][row]}
#     new_arr << row
#   end
#   new_arr
# end

def transpose(matrix)
  new_arr = Array.new(3) {Array.new(3)}
  rows = matrix.size
  col = matrix.first.size
  (0...col).each do |col|
    (0...rows).each do |rows|
      new_arr[col][rows] = matrix[rows][col]
    end
  end
  new_arr
end

# def transpose(matrix)
#   matrix[0].zip(matrix[1], matrix[2])
# end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
