
# 3. Modify the function above to also take any base (up to say 36, so certainly binary, octal and hexadecimal).

def dec_to_string(decimal_number, base = 10)
  return "0" if decimal_number == 0
  powers_of_base = powers_for(decimal_number, base)
  digits = []
  while last_exponent = powers_of_base.pop
    base_count, decimal_number = decimal_number.divmod(last_exponent)
    digits.push(DIGITS[base_count])
  end 
  digits.join("")
end 

def powers_for(decimal_number, base = 10)
  powers_for_array = []
  exponent = 0 
  loop do 
    new_power_of_base = base ** exponent
    break if new_power_of_base > decimal_number
    powers_for_array.push(new_power_of_base)
    exponent += 1 
  end
  powers_for_array
end 

DIGITS = (0..9).to_a + ("a".."z").to_a

test_cases = [
  {given: [0, 2], expected: "0"},
  {given: [0, 3], expected: "0"},
  {given: [0, 4], expected: "0"},
  {given: [1, 2], expected: "1"},
  {given: [1, 3], expected: "1"},
  {given: [1, 4], expected: "1"},
  {given: [2, 2], expected: "10"},
  {given: [2, 3], expected: "2"},
  {given: [2, 4], expected: "2"},
  {given: [4, 4], expected: "10"},
  {given: [8, 8], expected: "10"},
  {given: [16, 16], expected: "10"},
  {given: [18, 16], expected: "12"},
  {given: [31, 16], expected: "1f"},
  {given: [33, 32], expected: "11"},
]

powers_for_test_cases = [
  {given: [0, 2], expected: []}, 
  {given: [0, 3], expected: []}, 
  {given: [0, 4], expected: []}, 
  {given: [1, 2], expected: [1]},
  {given: [3, 2], expected: [1, 2]},
  {given: [10, 4], expected: [1, 4]},
  {given: [10, 16], expected: [1]}, 
  {given: [18, 16], expected: [1, 16]}, 
  {given: [31, 16], expected: [1, 16]}, 
  {given: [40, 16], expected: [1, 16]}, 
  {given: [280, 16], expected: [1, 16, 256]}, 

]

p "powers"
powers_for_test_cases.each do |test_case| 
  actual = powers_for(*test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 

p "dec_to_string"
test_cases.each do |test_case| 
  actual = dec_to_string(*test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 