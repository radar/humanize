require 'spec_helper'

RSpec.describe Humanize, "th locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :th
    end
  end

  tests = [
    [8.15, 'แปด จุด หนึ่ง ห้า'],
    [1002, 'หนึ่ง พัน และ สอง'],
    [2001, 'สอง พัน และ หนึ่ง'],
    [10_000, 'หนึ่ง หมื่น']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('แปด จุด สิบห้า')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('ความไม่มีที่สิ้นสุด')
      expect(neg_inf.humanize).to eql('เชิงลบ ความไม่มีที่สิ้นสุด')
      expect(nan.humanize).to eql('ไม่ได้กำหนด')
    end
  end
end
