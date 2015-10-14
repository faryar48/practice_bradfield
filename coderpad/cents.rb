# we are given a certain amount of change
# we want the change in nickels, pennies
# we want the smallest amount of coins

# examples:
# f(1) => 1 penny
# f(5) => 1 nickel
# f(7) => 1 nickel, 2 pennies
# f(10) => 2 nickels
# f(11) => 2 nickels, 1 penny

# return back a tuple (pair) or a record
# little end
# examples:
# f(cents) => [penny_count, nickel_count]
# f(1) => [1, 0]
# f(5) => [0, 1]
# f(7) => [2, 1]
# f(10) => [0, 2]
# f(11) => [1, 2]

# O(n)
# O(n)

def make_change(cents, coinset = [1, 5, 10, 25])
  change_array = []
  coinset.reverse.each do |coin|
    amount = (cents / coin).to_i
    change_array.unshift(amount)
    cents = cents % coin
  end
  change_array
end

# [p, n, d]
make_change_test_cases = [
  {
    given: [9, [3, 7]],
    expected: [0, 1]
  },
  {
    given: 5,
    expected: [0, 1, 0, 0]
  },
  {
    given: 7,
    expected: [2, 1, 0, 0]
  },
  {
    given: 10,
    expected: [0, 0, 1, 0]
  },
  {
    given: 11,
    expected: [1, 0, 1, 0]
  },
  {
    given: [1, [1, 5, 10, 20, 50]],
    expected: [1, 0, 0, 0, 0]
  },
  {
    given: [5, [1, 5, 10, 20, 50]],
    expected: [0, 1, 0, 0, 0]
  },

]

make_change_test_cases.each do |test_case|
  actual = make_change(*test_case[:given])
  if actual == test_case[:expected]
    p 'pass'
  else
    p 'fail', actual, test_case[:expected]
  end
end


