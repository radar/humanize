require 'spec_helper'

RSpec.describe Humanize, 'ru locale' do
  before do
    Humanize.configure do |config|
      config.default_locale = :ru
    end
  end

  tests = [
    [1, 'один'],
    [11, 'одиннадцать'],
    [1000, 'одна тысяча'],
    [2000, 'две тысячи'],
    [5000, 'пять тысяч'],
    [1000000, 'один миллион'],
    [2000000, 'два миллиона'],
    [3000000, 'три миллиона'],
    [5000000, 'пять миллионов'],
    [1.25, 'одна целая двадцать пять сотых']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 1.25
      expect(num.humanize(decimals_as: :number)).to eq('одна целая двадцать пять сотых')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = - inf
      nan = inf + neg_inf

      expect(inf.humanize).to eq('бесконечность')
      expect(neg_inf.humanize).to eq('минус бесконечность')
      expect(nan.humanize).to eq('неопределенность')
    end
  end
end
