require 'spec_helper'

RSpec.describe "Humanize" do
  after do
    Humanize.reset_config
  end

  describe 'locale option' do
    it 'uses default locale' do
      Humanize.config.default_locale = :fr
      expect(42.humanize).to eql('quarante-deux')
    end

    it 'uses locale passed as argument if given' do
      Humanize.config.default_locale = :en
      expect(42.humanize(locale: :fr)).to eql('quarante-deux')
    end

    describe 'turkish specific rules' do
      it 'one thousand and two equals "bin iki"' do
        expect(1002.humanize(locale: :tr)).to eql('bin iki')
      end

      it 'two thousand and one equals "iki bin bir' do
        expect(2001.humanize(locale: :tr)).to eql('iki bin bir')
      end

      it 'ten thousand equals "on bin"' do
        expect(10_000.humanize(locale: :tr)).to eql('on bin')
      end
    end

    describe 'azerbaijani specific rules' do
      it 'one thousand and two equals "min iki"' do
        expect(1002.humanize(locale: :az)).to eql('min iki')
      end

      it 'two thousand and one equals "iki min bir' do
        expect(2001.humanize(locale: :az)).to eql('iki min bir')
      end

      it 'ten thousand equals "on min"' do
        expect(10_000.humanize(locale: :az)).to eql('on min')
      end
    end

    describe 'indonesian specific rules' do
      before do
        Humanize.config.default_locale = :id
      end

      context 'one thousand' do
        it 'equals "satu ribu" when it is not the only thousand in its thousands range' do
          expect(1_101_000.humanize).to eql('satu juta seratus satu ribu')
          expect(2_201_042.humanize).to eql('dua juta dua ratus satu ribu empat puluh dua')
        end

        it 'equals "seribu" when it is the lone thousand in its thousands range' do
          expect(1_000.humanize).to eql('seribu')
          expect(1_042.humanize).to eql('seribu empat puluh dua')
          expect(1_001_042.humanize).to eql('satu juta seribu empat puluh dua')
          expect(1_000_001_042.humanize).to eql('satu miliar seribu empat puluh dua')
        end
      end
    end
  end

  describe 'decimals_as option' do
    it 'uses value from configuration' do
      Humanize.config.decimals_as = :number
      expect(0.42.humanize).to eql('zero point forty-two')
    end

    it 'uses value passed as argument if given' do
      Humanize.config.decimals_as = :number
      expect(0.42.humanize(decimals_as: :digits)).to eql('zero point four two')
    end

    describe 'when set as number' do
      before do
        Humanize.config.decimals_as = :number
      end

      it 'reads the decimals as digits if led by zero(s)' do
        expect(0.042.humanize).to eql('zero point zero four two')
        expect(0.0042.humanize).to eql('zero point zero zero four two')
      end
    end
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
