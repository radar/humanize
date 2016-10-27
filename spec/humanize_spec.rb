require 'rubygems'
require 'humanize'
require 'rspec'

describe "Humanize" do
  require_relative 'tests'

  after(:each) do
    Humanize.reset_config
  end

  TESTS.each do |num, human|
    it "#{num} is #{human}" do
      expect(num.humanize).to eql(human)
    end
  end

  describe 'locale option' do

    it 'uses default locale' do
      Humanize.config.default_locale = :fr
      expect(42.humanize).to eql("quarante-deux".gsub(/ +/, ' '))
    end

    it 'uses locale passed as argument if given' do
      Humanize.config.default_locale = :en
      expect(42.humanize(:locale => :fr)).to eql("quarante-deux".gsub(/ +/, ' '))
    end

  end

end
