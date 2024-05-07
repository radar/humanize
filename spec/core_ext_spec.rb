require 'spec_helper'

RSpec.describe "Humanize core extensions to Ruby" do
  after do
    Humanize.reset_config
  end

  describe 'both options work together' do
    it 'work together' do
      expect(
        0.42.humanize(locale: :fr, decimals_as: :number)
      ).to eql('zéro virgule quarante-deux')
    end
  end

  describe 'when called on instances of Rational, Complex, and Date::Infinity' do
    it 'will raise NoMethodError' do
      expect { Rational(1, 3).humanize }.to raise_error(NoMethodError, /humanize/)
      expect { Complex(1 + 2i).humanize }.to raise_error(NoMethodError, /humanize/)
      if defined? Date::Infinity
        expect do
          Date::Infinity.new.humanize
        end.to raise_error(NoMethodError, /humanize/)
      end
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('infinity')
      expect(neg_inf.humanize).to eql('negative infinity')
      expect(nan.humanize).to eql('undefined')
    end
  end

  describe 'when called on bigdecimal with decimal fractions' do
    it 'reads the decimal digits' do
      expect(BigDecimal('123').humanize).to eql('one hundred and twenty-three')
      expect(BigDecimal('123.45').humanize).to eql('one hundred and twenty-three point four five')
    end
  end
end
