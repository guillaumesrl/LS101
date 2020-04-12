def select_fruit(hsh)
  hsh_keys = hsh.keys
  counter = 0
  hsh_fruit = {}

  loop do

    break if counter == hsh_keys.size

    hsh_key = hsh_keys[counter]

    if hsh[hsh_key] == 'Fruit'
      hsh_fruit[hsh_key] = 'Fruit'
    end
    counter += 1
    
  end
  hsh_fruit
end
