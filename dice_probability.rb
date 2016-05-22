require 'pp'
R = 6

def calc_count(n, m)
  return 0 if m > n * R || m < 0

  a = Array.new(n - 1)
  for i in 0..n - 1
    a[i] = Array.new(R + 1, 0)
  end

  row = 0
  next_row = -> { row = row == R ? 0 : row + 1 }
  for i in 1..m - 1
    next_row.call
    a[0][row] = i < 7 ? 1 : 0 # the first dice
    for j in 1..n - 2
      a[j][row] = a[j - 1].inject(-a[j - 1][row]) { |sum, k| sum + k }
    end
  end
  next_row.call
  a[n - 2].inject(-a[n - 2][row]) { |sum, k| sum + k }
end

def calc(n, m)
  variants = R**n
  count = calc_count(n, m)
  count.to_f / variants
end

def main
  fail 'Enter n (count), m (sum)' if ARGV.length < 2

  n = ARGV[0].to_i
  m = ARGV[1].to_i

  pp "Dice count: #{n}"
  pp "Sum: #{m}"
  probability = calc(n, m)
  pp "Probability: #{probability}"
end

main if __FILE__ == $PROGRAM_NAME
