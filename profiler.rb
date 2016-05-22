require 'ruby-prof'
require_relative 'dice_probability'


n = ARGV[0].to_i
m = ARGV[1].to_i

result = RubyProf.profile do
  calc(n, m)
end

# print a graph profile to text
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})
