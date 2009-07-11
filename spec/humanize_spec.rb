require 'rubygems'
require 'lib/humanize'
require 'spec'
describe "Humanize" do
  require 'tests'
  
  TESTS.each do |num, human|
    it "#{num} is #{human}" do
      num.humanize.should eql(human)
    end
  end

 
end
  
  
  