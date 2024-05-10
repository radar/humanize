# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Humanize, "fr CH locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :'fr-CH'
    end
  end

  tests = [
    [71, 'septante-et-un'],
    [80.15, 'huitante virgule un cinq'],
    [1090, 'mille nonante'],
    [2095, 'deux mille nonante-cinq'],
    [10_000, 'dix mille'],
    [1_000_000, "un million"],
    [2_000_000, "deux millions"],
    [5_000_000, "cinq millions"],
    [1_000_000_000, "un milliard"],
    [2_000_000_000, "deux milliards"],
    [5_000_000_000, "cinq milliards"]
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('huit virgule quinze')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('infini')
      expect(neg_inf.humanize).to eql('négatif infini')
      expect(nan.humanize).to eql('indéfini')
    end
  end
end
