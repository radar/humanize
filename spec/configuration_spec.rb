require 'spec_helper'

module Humanize

  describe Configuration do

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

  end

end
