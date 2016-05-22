require "pp"
R = 6

def main
  fail "Enter n, m" if ARGV.length < 2

  n = ARGV[0].to_i
  m = ARGV[1].to_i

  pp "Dice count: #{n}"
  pp "Sum: #{m}"
  probability = calc(n, m)
  pp "Probability: #{probability}"
end

def calc_count(n, m)
  fail "Incorrect sum" if m < 0
  return 0 if m > n * R

  a = Array.new(n - 1)
  for i in 0..n-1
    a[i] = Array.new(R + 1, 0)
  end
  # pp a
  row = R - 1
  next_row = -> { row = row == R ? 0 : row + 1 }
  for i in 1..m-1
    # pp "**********************"
    # pp "Sum: #{i}"
    next_row[]
    # pp "Current row: #{row}"
    a[0][row] = i < 7 ? 1 : 0 # the first dice
    for j in 1..(n - 2)
      # pp "J: #{j}"
      # pp "Excluded: #{a[j-1][row]}"
      # pp a[j-1]
      a[j][row] = a[j-1].inject(-a[j-1][row]){ |sum, k| sum + k }
      # pp a[j]
    end
    # pp "Rez"
    # pp a
    # break if i > 5
  end
  # pp "Last:"
  # pp a[n-2]

  b = []
  for i in 0..n-1
    b << a[i][row]
  end
  # pp b
  next_row[]
  ex = a[n - 2][row]
  # pp "Row: #{row}, exluded: #{ex}"
  # pp "-----"

  count = a[n - 2].inject(-ex){ |sum, k| sum + k }
  # pp count
  count
end

def calc(n, m)
  variants = R ** n
  count = calc_count(n, m)
  probability = count.to_f / variants
  probability
end

main if __FILE__ == $PROGRAM_NAME
