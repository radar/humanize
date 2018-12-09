require 'spec_helper'

RSpec.describe Humanize, "id locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :id
    end
  end

  tests = [
    [8.15, 'delapan koma satu lima'],
    [1002, 'seribu dua'],
    [2001, 'dua ribu satu'],
    [10_000, 'sepuluh ribu']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('delapan koma lima belas')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('tak terhingga')
      expect(neg_inf.humanize).to eql('minus tak terhingga')
      expect(nan.humanize).to eql('tak terdefinisi')
    end
  end
end
