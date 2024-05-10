# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Humanize, "pt locale" do
  before do
    Humanize.configure do |config|
      config.locale = :pt
    end
  end

  tests = [
    [8.15, 'oito vírgula um cinco'],
    [1000, 'mil'],
    [1002, 'mil e dois'],
    [2000, 'dois mil'],
    [2002, 'dois mil e dois'],
    [10_000, 'dez mil']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('oito vírgula quinze')
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
