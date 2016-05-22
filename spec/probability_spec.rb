require 'spec_helper'
require_relative '../dice_probability'

describe 'n = 7' do
  n = 7
  examples = [0, 0, 0, 0, 0, 0, 1, 7, 28, 84, 210, 462, 917, 1667, 2807, 4417, 6538, 9142, 12_117, 15_267, 18_327, 20_993, 22_967, 24_017, 24_017, 22_967, 20_993, 18_327, 15_267, 12_117, 9142, 6538, 4417, 2807, 1667, 917, 462, 210, 84, 28, 7, 1]
  examples.each_with_index do |count, sum|
    m = sum + 1
    it "should return #{count} when n == #{n}, m == #{m}" do
      expect(calc_count(n, m)).to eq(count)
    end
  end
end
