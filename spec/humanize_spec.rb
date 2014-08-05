require 'rubygems'
require 'humanize'
require 'rspec'

describe "Humanize" do
  require_relative 'tests'
  
  TESTS.each do |num, human|
    it "#{num} is #{human}" do
      num.humanize.should eql(human)
    end
  end 
end
  
  
  