require 'spec_helper'

RSpec.describe Humanize, "it locale" do
  # rubocop:disable Metrics/LineLength
  
  before do
    Humanize.configure do |config|
      config.default_locale = :it
    end
  end
  
  it_tests = [
    [-1, "meno uno"],
    [-0.042, "meno zero punto zero quattro due"],
    [-0.00003345, "meno zero punto zero zero zero zero tre tre quattro cinque"],
    [-0.0000017854, "meno zero punto zero zero zero zero zero uno sette otto cinque quattro"],
    [0.000000123, "zero punto zero zero zero zero zero zero uno due tre"],
    [0, "zero"],
    [8.15, "otto punto uno cinque"],
    [8.000015, "otto punto zero zero zero zero uno cinque"],
    [8, "otto"],
    [11, "undici"],
    [21, "ventuno"],
    [61, "sessantuno"],
    [71, "settantuno"],
    [99, "novantanove"],
    [100, "cento"],
    [101, "centouno"],
    [111, "centoundici"],
    [121, "centoventuno"],
    [167, "centosessantasette"],
    [1000, "mille"],
    [1079, "mille settantanove"],
    [1577, "mille cinquecentosettantasette"],
    [2000, "duemila"],
    [10_000, "diecimila"],
    [10_079, "diecimila settantanove"],
    [50_877, "cinquantamila ottocentosettantasette"],
    [100_444, "centomila quattrocentoquarantaquattro"],
    [235_409, "duecentotrentacinquemila quattrocentonove"],
    [1_007_310, "un milione settemila, trecentodieci"],
    [8_017_878, "otto milioni diciassettemila, ottocentosettantotto"],
    [21_007_310, "ventuno milioni settemila, trecentodieci"],
    [321_007_310, "trecentoventuno milioni settemila, trecentodieci"],
    [4_321_007_310, "quattro miliardi trecentoventuno milioni, settemila, trecentodieci"],
    [14_321_007_310, "quattordici miliardi trecentoventuno milioni, settemila, trecentodieci"],
    [1_112_176_514_321_007_310, "un quintilione centododici quadrilioni, centosettantasei trilioni, cinquecentoquattordici miliardi, trecentoventuno milioni, settemila, trecentodieci"],
    [15_000_000_000_000_000_333, "quindici quintilioni trecentotrentatre"],
    [111_000_000_000_000_000_000_000, "centoundici sestilioni"],
  ]
  # rubocop:enable Metrics/LineLength

  it_tests.each do |num, output|
    it "#{num} is equal to #{output}" do
      expect(num.humanize).to eq(output)
    end
  end

  describe 'when called on bigdecimal' do
    it 'reads correctly' do
      expect(BigDecimal(it_tests.last.first).humanize).to eql(it_tests.last.last)
    end
  end
end
