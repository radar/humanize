require 'rubygems'
require 'humanize'
require 'rspec'

module Humanize

  describe Config do

    after(:each) do
      Humanize.reset_config
    end

    describe "#default_locale" do

      it "default value is :en" do
        expect(Humanize.config.default_locale).to eq(:en)
      end

      it "value can be changed using a block" do
        Humanize.configure do |config|
          config.default_locale = :fr
        end
        expect(Humanize.config.default_locale).to eq(:fr)
      end

      it "value can be changed directly" do
        Humanize.config.default_locale = :fr
        expect(Humanize.config.default_locale).to eq(:fr)
      end

    end

    describe "#decimals_as" do

      it "default value is :digits" do
        expect(Humanize.config.decimals_as).to eq(:digits)
      end

    end

  end

end
