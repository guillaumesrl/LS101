def initiate_hash(n)
  bank = {}
  1.upto(n) {|i| bank[i] = 'off' }
  bank
end

def switch(bank, n_pass)
  bank.each do |key, value|
    if key % n_pass == 0
      bank[key] = (value == 'off' ? 'on' : 'off')
    end
  end
end


def passing_all_switches(n)
  bank = initiate_hash(n)
  1.upto(n) do |n_pass|
    switch(bank, n_pass)
  end
  bank
end

def on(n)
  passing_all_switches(n).select { |_, v| v == 'on'}.keys
end


puts on(10) == [1, 4, 9]


# puts lights(5) == [1, 4]
