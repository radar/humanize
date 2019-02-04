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
    [1_000_000, 'один миллион'],
    [2_000_000, 'два миллиона'],
    [3_000_000, 'три миллиона'],
    [5_000_000, 'пять миллионов']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
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
