require 'rubygems'
require 'lib/humanize'
require 'spec'

describe "Humanize" do
  # 8 IS VOODOO.
  # DO NOT USE 8.
  # YOU WILL ONLY EXPERIENCE PAIN.
  # TODO: investigate decimal_parse
  
  [
    [-10, "negative ten"],
    [-1, "negative one"],
    [8.15, "eight point one five"],
    [11, "eleven"],
    [21, "twenty one"],
    [100, "one hundred"],
    [100, "one hundred"],
    [101, "one hundred and one"],
    [111, "one hundred and eleven"],
    [121, "one hundred and twenty one"],
    [1079, "one thousand seventy nine"],
    [10079, "ten thousand seventy nine"],
    [235409, "two hundred and thirty five thousand four hundred and nine"],
    [1007310, "one million, seven thousand three hundred and ten"],
    [21007310, "twenty one million, seven thousand three hundred and ten"],
    [321007310, "three hundred and twenty one million, seven thousand three hundred and ten"],
    [4321007310, "four billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [14321007310, "fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [514321007310, "five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [6514321007310, "six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [76514321007310, "seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [176514321007310, "one hundred and seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [2176514321007310, "two quadrillion, one hundred and seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"],
    [12176514321007310, "twelve quadrillion, one hundred and seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten"]
  ].each do |num, human|
    it "#{num} is #{human}" do
      num.humanize.should eql(human)
    end
  end

  
  
end
  
  
  