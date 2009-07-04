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
  ].each do |num, human|
    it "#{num} is #{human}" do
      num.humanize.should eql(human)
    end
  end
  
  it "100 is one hundred" do
    100.humanize.should eql("one hundred")
  end
  
  it "101 is one hundred and one" do
    101.humanize.should eql("one hundred and one")
  end
  
  it "111 is one hundred and eleven" do
    111.humanize.should eql("one hundred and eleven")
  end
  
  it "121 is one hundred and twenty one" do
    121.humanize.should eql("one hundred and twenty one")
  end
  
  it "1079 is one thousand and seventy nine" do
    1079.humanize.should eql("one thousand seventy nine")
  end
  
  it "10079 is one thousand and seventy nine" do
    10079.humanize.should eql("ten thousand seventy nine")
  end
  
  it "235409 is two hundred and thirty five thousand four hundred and nine" do
    235409.humanize.should eql("two hundred and thirty five thousand four hundred and nine")
  end
  
  it "1007310 is one million seven thousand three hundred and ten" do
    1007310.humanize.should eql("one million, seven thousand three hundred and ten")
  end
  
  it "21007310 is twenty one million seven thousand three hundred and ten" do
    21007310.humanize.should eql("twenty one million, seven thousand three hundred and ten")
  end
  
  it "321007310 is three hundred and twenty one million seven thousand three hundred and ten" do
    321007310.humanize.should eql("three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "4321007310 is four billion, three hundred and twenty one million seven thousand three hundred and ten" do
    4321007310.humanize.should eql("four billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "14321007310 is fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    14321007310.humanize.should eql("fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "514321007310 is five hundred and fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    514321007310.humanize.should eql("five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "6514321007310 is six trillion five hundred and fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    6514321007310.humanize.should eql("six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "76514321007310 is seventy six trillion five hundred and fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    76514321007310.humanize.should eql("seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "176514321007310 is one hundred and seventy six trillion five hundred and fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    176514321007310.humanize.should eql("one hundred and seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "2176514321007310 is two quadrillion, one hundred and seventy six trillion five hundred and fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    2176514321007310.humanize.should eql("two quadrillion, one hundred and seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  it "12176514321007310 is twelve quadrillion, one hundred and seventy six trillion five hundred and fourteen billion, three hundred and twenty one million seven thousand three hundred and ten" do
    12176514321007310.humanize.should eql("twelve quadrillion, one hundred and seventy six trillion, five hundred and fourteen billion, three hundred and twenty one million, seven thousand three hundred and ten")
  end
  
  
end
  
  
  