require 'spec_helper'

RSpec.describe Humanize, 'zh tw locale' do
  before do
    Humanize.configure do |config|
      config.default_locale = :'zh-tw'
    end
  end

  tests = [
    [1, '壹'],
    [48, '肆拾捌'],
    [100, '佰'],
    [101, '佰壹'],
    [110, '佰拾'],
    [199, '佰玖拾玖'],
    [999, '玖佰玖拾玖'],
    [1000, '壹仟'],
    [3456, '参仟肆佰伍拾陸'],
    [9999, '玖仟玖佰玖拾玖'],
    [21_111, '贰萬壹仟壹佰壹拾壹'],
    [99_999, '玖萬玖仟玖佰玖拾玖'],
    [9_876_543, '玖佰捌拾柒萬陸仟伍佰肆拾叁'],
    [10_000_000, '壹仟萬'],
    [100_000_000, '壹億'],
    [765_432_109, '柒億陸仟伍佰肆拾叁萬貳仟壹佰玖'],
    [-123_422_223.48_948_753, '負壹億貳仟參佰肆拾貳萬貳仟貳佰貳拾參・肆捌玖肆捌柒伍參'],
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.1592
      expect(num.humanize).to eq('捌・壹伍玖貳')
      expect(num.humanize(decimals_as: :number)).to eq('捌・壹仟伍佰玖拾貳')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('無限大')
      expect(neg_inf.humanize).to eql('負無限大')
      expect(nan.humanize).to eql('未定義')
    end
  end
end
