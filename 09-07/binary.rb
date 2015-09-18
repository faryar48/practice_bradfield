
# 2. Write a function which takes an integer and returns the same number as a string of binary digits. There are many ways to do this... see if you can find an elegant solution that progressively pushes powers of 2 to a stack, then pops into a string.

def binary(decimal_number)
  return "0" if decimal_number == 0
  powers_of_two = powers_of_two_for(decimal_number)
  binary_digits = []
  while last_exponent = powers_of_two.pop
    if decimal_number / last_exponent >= 1 
      binary_digits.push(1)
      decimal_number = decimal_number - last_exponent
    else 
      binary_digits.push(0)
    end 
  end 
  binary_digits.join("")
end 

def powers_of_two_for(decimal_number)
  powers_of_two = []
  exponent = 0 
  loop do 
    new_power_of_two = 2 ** exponent
    break if new_power_of_two > decimal_number
    powers_of_two.push(new_power_of_two)
    exponent += 1 
  end
  powers_of_two
end 




test_cases = [
  {given: 0, result: "0"},
  {given: 1, result: "1"},
  {given: 2, result: "10"}, 
  {given: 36, result: "100100"},
  {given: 100, result: "1100100"},
  {given: 88, result: "1011000"},
  {given: 3012, result: "101111000100"},

]

test_cases.each do |test_case| 
  actual = binary(test_case[:given])
  if actual == test_case[:result]
    p "pass"
  else 
    p "fail", actual, test_case[:result]
    exit
  end 
end 

# p binary(36) # 100100
# p binary(2) # 10
# p binary(1) # 1
