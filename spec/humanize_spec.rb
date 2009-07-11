require 'rubygems'
require 'lib/humanize'
require 'spec'
require 'tests'

describe "Humanize" do
  @tests.each do |num, human|
    it "#{num} is #{human}" do
      num.humanize.should eql(human)
    end
  end

 
end
  
  
  