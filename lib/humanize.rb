require 'bigdecimal'
require_relative './humanize/locales'

module Humanize
  SPACE = ' '.freeze
  EMPTY = ''.freeze
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT

  def humanize(locale: Humanize.config.default_locale,
               decimals_as: Humanize.config.decimals_as)
    locale_class, spacer = Humanize.for_locale(locale)

    return locale_class::SUB_ONE_GROUPING[0] if zero?

    infinity = to_f.infinite?
    if infinity
      infinity_word = locale_class::INFINITY
      return infinity == 1 ? infinity_word : "#{locale_class::NEGATIVE}#{spacer}#{infinity_word}"
    elsif is_a?(Float) && nan?
      return locale_class::UNDEFINED
    end

    sign = locale_class::NEGATIVE if negative?

    parts = locale_class.new.humanize(abs)
    process_decimals(locale_class, locale, parts, decimals_as, spacer)
    Humanize.stringify(parts, sign, spacer)
  end

  def self.for_locale(locale)
    case locale.to_sym
    # NOTE: add locales here in ealphabetical order
    when :az
      [Humanize::Az, SPACE]
    when :de
      [Humanize::De, SPACE]
    when :en
      [Humanize::En, SPACE]
    when :fr
      [Humanize::Fr, SPACE]
    when :id
      [Humanize::Id, SPACE]
    when :pt
      [Humanize::Pt, SPACE]
    when :ru
      [Humanize::Ru, SPACE]
    when :th
      [Humanize::Th, EMPTY]
    when :tr
      [Humanize::Tr, SPACE]
    else
      raise "Unsupported humanize locale: #{locale}"
    end
  end

  def self.stringify(parts, sign, spacer)
    output = parts.reverse.join(spacer).squeeze(spacer)
    if sign
      "#{sign} #{output}"
    else
      output
    end
  end

  def process_decimals(locale_class, locale, parts, decimals_as, spacer)
    return unless is_a?(Float) || is_a?(BigDecimal)

    # Why 15?
    # (byebug) BigDecimal.new(number, 15)
    # 0.8000015e1
    # (byebug) BigDecimal.new(number, 16)
    # 0.8000014999999999e1
    decimal = BigDecimal(self, 15) - BigDecimal(to_i)

    _sign, significant_digits, _base, exponent = decimal.split
    return if significant_digits == "0"

    grouping = locale_class::SUB_ONE_GROUPING
    leading_zeroes = [grouping[0]] * exponent.abs
    decimals_as = :digits if leading_zeroes.any?

    decimals_as_words = case decimals_as
                        when :digits
                          digits = significant_digits.chars.map do |num|
                            grouping[num.to_i]
                          end

                          (leading_zeroes + digits).join(spacer)
                        when :number
                          significant_digits.to_i.humanize(locale: locale)
                        end

    parts.insert(0, decimals_as_words, locale_class::POINT)
  end

  class << self
    attr_writer :config
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.reset_config
    @config = Configuration.new
  end

  def self.configure
    yield(config)
  end

  class Configuration
    attr_accessor :default_locale, :decimals_as

    def initialize
      @default_locale = :en
      @decimals_as = :digits
    end
  end
end

class Integer
  include Humanize
end

class Float
  include Humanize
end

class BigDecimal
  include Humanize
end
