require 'spec_helper'
require_relative '../dice_probability'

shared_examples_for 'dice' do |examples, n|
  examples.each_with_index do |count, sum|
    m = sum + 1
    it "should return count of variants #{count} when n == #{n}, m == #{m}" do
      expect(calc_count(n, m)).to eq(count)
    end
  end
end

describe 'n = 2' do
  examples = [0, 1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1, 0]

  include_examples 'dice', examples, 2
end

describe 'n = 7' do
  examples = [0, 0, 0, 0, 0, 0, 1, 7, 28, 84, 210, 462, 917, 1667, 2807, 4417,
              6538, 9142, 12_117, 15_267, 18_327, 20_993, 22_967, 24_017, 24_017, 22_967,
              20_993, 18_327, 15_267, 12_117, 9142, 6538, 4417, 2807, 1667, 917, 462,
              210, 84, 28, 7, 1, 0]

  include_examples 'dice', examples, 7
end
