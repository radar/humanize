require 'spec_helper'

RSpec.describe "Humanize" do
  after do
    Humanize.reset_config
  end

  describe 'locale option' do
    it 'uses default locale' do
      Humanize.config.default_locale = :fr
      expect(Humanize.format(42)).to eql('quarante-deux')
    end

    it 'uses locale passed as argument if given' do
      Humanize.config.default_locale = :en
      expect(Humanize.format(42, locale: :fr)).to eql('quarante-deux')
    end

    describe 'turkish specific rules' do
      it 'one thousand and two equals "bin iki"' do
        expect(Humanize.format(1002, locale: :tr)).to eql('bin iki')
      end

      it 'two thousand and one equals "iki bin bir' do
        expect(Humanize.format(2001, locale: :tr)).to eql('iki bin bir')
      end

      it 'ten thousand equals "on bin"' do
        expect(Humanize.format(10_000, locale: :tr)).to eql('on bin')
      end
    end

    describe 'malaysia specific rules' do
      before do
        Humanize.config.default_locale = :ms
      end

      context 'one thousand' do
        it 'equals "satu ribu" when it is not the only thousand in its thousands range' do
          expect(Humanize.format(1_101_000)).to eql('satu juta seratus satu ribu')
          expect(Humanize.format(2_201_042)).to eql('dua juta dua ratus satu ribu empat puluh dua')
        end

        it 'equals "seribu" when it is the lone thousand in its thousands range' do
          expect(Humanize.format(1_000)).to eql('seribu')
          expect(Humanize.format(1_042)).to eql('seribu empat puluh dua')
          expect(Humanize.format(1_001_042)).to eql('satu juta seribu empat puluh dua')
          expect(Humanize.format(1_000_001_042)).to eql('satu bilion seribu empat puluh dua')
        end
      end
    end

    describe 'azerbaijani specific rules' do
      it 'one thousand and two equals "min iki"' do
        expect(Humanize.format(1002, locale: :az)).to eql('min iki')
      end

      it 'two thousand and one equals "iki min bir' do
        expect(Humanize.format(2001, locale: :az)).to eql('iki min bir')
      end

      it 'ten thousand equals "on min"' do
        expect(Humanize.format(10_000, locale: :az)).to eql('on min')
      end
    end

    describe 'indonesian specific rules' do
      before do
        Humanize.config.default_locale = :id
      end

      context 'one thousand' do
        it 'equals "satu ribu" when it is not the only thousand in its thousands range' do
          expect(Humanize.format(1_101_000)).to eql('satu juta seratus satu ribu')
          expect(Humanize.format(2_201_042)).to eql('dua juta dua ratus satu ribu empat puluh dua')
        end

        it 'equals "seribu" when it is the lone thousand in its thousands range' do
          expect(Humanize.format(1_000)).to eql('seribu')
          expect(Humanize.format(1_042)).to eql('seribu empat puluh dua')
          expect(Humanize.format(1_001_042)).to eql('satu juta seribu empat puluh dua')
          expect(Humanize.format(1_000_001_042)).to eql('satu miliar seribu empat puluh dua')
        end
      end
    end
  end

  describe 'decimals_as option' do
    it 'uses value from configuration' do
      Humanize.config.decimals_as = :number
      expect(Humanize.format(0.42)).to eql('zero point forty-two')
    end

    it 'uses value passed as argument if given' do
      Humanize.config.decimals_as = :number
      expect(Humanize.format(0.42, decimals_as: :digits)).to eql('zero point four two')
    end

    describe 'when set as number' do
      before do
        Humanize.config.decimals_as = :number
      end

      it 'reads the decimals as digits if led by zero(s)' do
        expect(Humanize.format(0.042)).to eql('zero point zero four two')
        expect(Humanize.format(0.0042)).to eql('zero point zero zero four two')
      end
    end
  end

  describe 'both options work together' do
    it 'work together' do
      expect(
        Humanize.format(0.42, locale: :fr, decimals_as: :number)
      ).to eql('zéro virgule quarante-deux')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(Humanize.format(inf)).to eql('infinity')
      expect(Humanize.format(neg_inf)).to eql('negative infinity')
      expect(Humanize.format(nan)).to eql('undefined')
    end
  end

  describe 'when called on bigdecimal with decimal fractions' do
    it 'reads the decimal digits' do
      expect(Humanize.format(BigDecimal('123'))).to eql('one hundred and twenty-three')
      expect(Humanize.format(BigDecimal('123.45'))).to eql('one hundred and twenty-three point four five')
    end
  end
end
