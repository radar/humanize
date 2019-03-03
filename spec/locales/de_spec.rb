require 'spec_helper'

RSpec.describe Humanize, "de locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :de
    end
  end

  tests = [
    [8.15, 'Acht Komma Eins Fünf'],
    [1002, 'Eins Tausend und Zwei'],
    [2001, 'Zwei Tausend und Eins'],
    [10_000, 'Zehn Tausend']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('Acht Komma Fünfzehn')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('Unendlich')
      expect(neg_inf.humanize).to eql('negativ Unendlich')
      expect(nan.humanize).to eql('Undefiniert')
    end
  end
end
