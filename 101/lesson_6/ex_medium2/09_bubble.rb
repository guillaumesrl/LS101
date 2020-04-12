

def bubble_sort!(arr)
  loop do
    change = 'no'
    0.upto(arr.size-2) do |idx|
      next if arr[idx] < arr[idx+1]
      arr[idx], arr[idx+1] = arr[idx+1], arr[idx] if arr[idx] > arr[idx+1]
      change = 'yes'
    end
    break if change = 'no'

  end
  arr
end


p bubble_sort!([6, 2, 7, 1, 4])