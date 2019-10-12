arr = ['10','11','9','7','8']

p arr.sort_by {|a,b| b.to_i <=> a.to_i}