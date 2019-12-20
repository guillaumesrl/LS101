# def bubble_sort!(arr)
#   num1 = 0
#   num2 = 1
#   swap = []
#   loop do
#     if arr[num1] > arr[num2]
#       arr[num1], arr[num2] = arr[num2], arr[num1]
#       swap << 'swapped'
#     else
#       swap << 'no'
#     end
#     num1 += 1  
#     num2 += 1
#     break if swap.size == arr.size-1 && swap.uniq == ['no']
#     (num1, num2, swap = 0, 1, []) if num2 > arr.size-1
#   end
#   arr
# end

def bubble_sort!(arr)
  loop do
    swap = false
    0.upto(arr.size-2) do |idx|
      next if arr[idx] < arr[idx+1]
      arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
      swap = true
    end
    break unless swap
  end
  arr
end

p bubble_sort!([6, 2, 7, 1, 4])