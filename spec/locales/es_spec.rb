# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Humanize, "es locale" do
  before do
    Humanize.configure do |config|
      config.locale = :es
    end
  end
  es_tests = [
    [-1, "uno negativo"],
    [0, "cero"],
    [2.2, "dos punto dos"],
    [8, "ocho"],
    [10, "diez"],
    [11, "once"],
    [20, "veinte"],
    [21, "veintiuno"],
    [29, "veintinueve"],
    [30, "treinta"],
    [38, "treinta y ocho"],
    [84, "ochenta y cuatro"],
    [40, "cuarenta"],
    [50, "cincuenta"],
    [90, "noventa"],
    [99, "noventa y nueve"],
    [100, "cien"],
    [101, "ciento uno"],
    [110, "ciento diez"],
    [111, "ciento once"],
    [200, "doscientos"],
    [999, "novecientos noventa y nueve"],
    [1000, "mil"],
    [1001, "mil uno"],
    [2000, "dos mil"],
    [2533, "dos mil quinientos treinta y tres"],
    [10_000, "diez mil"],
    [100_000, "cien mil"],
    [1_000_000, "un millón"],
    [1_243_433, "un millón doscientos cuarenta y tres mil cuatrocientos treinta y tres"],
    [2_000_000, "dos millones"],
    [20_000_000, "veinte millones"],
    [20_000_001, "veinte millones uno"]
  ]

  es_tests.each do |num, output|
    it "#{num} is equal to #{output}" do
      expect(num.humanize).to eq(output)
    end
  end

  describe 'when called on bigdecimal' do
    it 'reads correctly' do
      expect(BigDecimal(es_tests.last.first).humanize).to eql(es_tests.last.last)
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('infinito')
      expect(neg_inf.humanize).to eql('negativo infinito')
      expect(nan.humanize).to eql('indefinido')
    end
  end
end
