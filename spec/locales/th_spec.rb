require 'spec_helper'

RSpec.describe Humanize, "th locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :th
    end
  end

  # rubocop:disable Layout/LineLength
  tests = [
    [8.15, 'แปดจุดหนึ่งห้า'],
    [101, 'หนึ่งร้อยหนึ่ง'],
    [1002, 'หนึ่งพันสอง'],
    [1202, 'หนึ่งพันสองร้อยสอง'],
    [1220, 'หนึ่งพันสองร้อยยี่สิบ'],
    [2001, 'สองพันหนึ่ง'],
    [10_000, 'หนึ่งหมื่น'],
    [9_209_002, 'เก้าล้านสองแสนเก้าพันสอง'],
    [11_230_782, 'สิบเอ็ดล้าน สองแสนสามหมื่นเจ็ดร้อยแปดสิบสอง'],
    [987_654_321_123_230_782, 'เก้าแสนแปดหมื่นเจ็ดพันหกร้อยห้าสิบสี่ล้านล้าน สามแสนสองหมื่นหนึ่งพันหนึ่งร้อยยี่สิบสามล้าน สองแสนสามหมื่นเจ็ดร้อยแปดสิบสอง'],
    [444_333_221_111_112_176_514_321_007_310, 'สี่แสนสี่หมื่นสี่พันสามร้อยสามสิบสามล้านล้านล้านล้าน สองแสนสองหมื่นหนึ่งพันหนึ่งร้อยสิบเอ็ดล้านล้านล้าน หนึ่งแสนหนึ่งหมื่นสองพันหนึ่งร้อยเจ็ดสิบหกล้านล้าน ห้าแสนหนึ่งหมื่นสี่พันสามร้อยยี่สิบเอ็ดล้าน เจ็ดพันสามร้อยสิบ']
  ]
  # rubocop:enable Layout/LineLength

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('แปดจุดสิบห้า')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('เป็นอนันต์')
      expect(neg_inf.humanize).to eql('ติดลบเป็นอนันต์')
      expect(nan.humanize).to eql('ไม่ได้กำหนด')
    end
  end
end
