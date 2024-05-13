# frozen_string_literal: true

require 'spec_helper'

module Humanize
  describe Configuration do
    after(:each) do
      Humanize.reset_config
    end

    describe "#default_locale (deprecated)" do
      it "default value is :en" do
        expect(Humanize.config.default_locale).to eq(:en)
      end

      it "value can be changed using a block" do
        Humanize.configure do |config|
          config.locale = :fr
        end
        expect(Humanize.config.default_locale).to eq(:fr)
        expect(Humanize.config.locale).to eq(:fr)
      end

      it "value can be changed directly" do
        Humanize.config.locale = :fr
        expect(Humanize.config.default_locale).to eq(:fr)
        expect(Humanize.config.locale).to eq(:fr)
      end
    end

    describe "#locale" do
      it "default value is :en" do
        expect(Humanize.config.locale).to eq(:en)
      end

      it "value can be changed using a block" do
        Humanize.configure do |config|
          config.locale = :fr
        end
        expect(Humanize.config.locale).to eq(:fr)
      end

      it "value can be changed directly" do
        Humanize.config.locale = :fr
        expect(Humanize.config.locale).to eq(:fr)
      end
    end
  end
end
