require 'spec_helper'

RSpec.describe Humanize, "az locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :az
    end
  end

  tests = [
    [8.15, 'səkkiz vergül bir beş'],
    [1002, 'min iki'],
    [2001, 'iki min bir'],
    [10_000, 'on min']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('səkkiz vergül on beş')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('sonsuz')
      expect(neg_inf.humanize).to eql('mənfi sonsuz')
      expect(nan.humanize).to eql('undefined')
    end
  end
end
