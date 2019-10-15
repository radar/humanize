require 'spec_helper'

RSpec.describe Humanize, "sv locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :sv
    end
  end

  tests = [
      [8.15, 'åtta komma ettfem'],
      [1002, 'etttusentvå'],
      [2001, 'tvåtusenett'],
      [10_000, 'tiotusen']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('åtta komma femton')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('oändligheten')
      expect(neg_inf.humanize).to eql('minus oändligheten')
      expect(nan.humanize).to eql('odefinierat')
    end
  end
end
