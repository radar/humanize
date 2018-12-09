require 'spec_helper'

RSpec.describe Humanize, "tr locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :tr
    end
  end

  tests = [
    [8.15, 'sekiz virgül bir beş'],
    [1002, 'bin iki'],
    [2001, 'iki bin bir'],
    [10_000, 'on bin']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('sekiz virgül on beş')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('sonsuz')
      expect(neg_inf.humanize).to eql('eksi sonsuz')
      expect(nan.humanize).to eql('tanımsız')
    end
  end
end
