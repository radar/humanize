require 'spec_helper'

RSpec.describe Humanize, "fr locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :fr
    end
  end

  tests = [
    [8.15, 'huit virgule un cinq'],
    [1002, 'mille deux'],
    [2001, 'deux mille un'],
    [10_000, 'dix mille']
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
