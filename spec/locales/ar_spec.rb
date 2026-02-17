# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Humanize, 'ar locale' do
  before do
    Humanize.configure do |config|
      config.locale = :ar
    end
  end

  tests = [
    [1, 'واحد'],
    [11, 'أحد عشر'],
    [23, 'ثلاثة وعشرون'],
    [102, 'مائة واثنان'],
    [233, 'مائتان وثلاثة وثلاثون'],
    [678, 'ستمائة وثمانية وسبعون'],
    [876, 'ثمانمائة وستة وسبعون'],
    [1000, 'ألف'],
    [1756, 'ألف و سبعمائة وستة وخمسون'],
    [2000, 'ألفان'],
    [5000, 'خمسة آلاف'],
    [10_000, 'عشرة آلاف'],
    [20_000, 'عشرون ألف'],
    [202_000, "مائتان وألفان"],
    [1_000_000, 'مليون'],
    [2_000_000, 'مليونان'],
    [3_000_000, 'ثلاثة ملايين'],
    [5_000_000, 'خمسة ملايين'],
    [9_000_000, 'تسعة ملايين'],
    [10_000_000, 'عشرة ملايين'],
    [1_000_000_000, 'مليار'],
    [9_000_000_000_000, 'تسعة تريليونات']
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

      expect(inf.humanize).to eq('لا نهاية')
      expect(neg_inf.humanize).to eq('سالب لا نهاية')
      expect(nan.humanize).to eq('غير معرف')
    end
  end
end
