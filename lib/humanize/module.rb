# frozen_string_literal: true

require 'bigdecimal'
require_relative 'locales'

module Humanize
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT

  class << self
    def format(number,
               locale: Humanize.config.default_locale,
               decimals_as: Humanize.config.decimals_as)
      locale_class, spacer = Humanize.for_locale(locale)

      return locale_class::SUB_ONE_GROUPING[0] if number.zero?

      infinity = number.to_f.infinite?
      if infinity
        infinity_word = locale_class::INFINITY
        return infinity == 1 ? infinity_word : "#{locale_class::NEGATIVE}#{spacer}#{infinity_word}"
      elsif number.is_a?(Float) && number.nan?
        return locale_class::UNDEFINED
      end

      sign = locale_class::NEGATIVE if number.negative?

      parts = locale_class.new.humanize(number.abs)
      process_decimals(number, locale_class, locale, parts, decimals_as, spacer)
      Humanize.stringify(parts, sign, spacer)
    end

    def for_locale(locale)
      case locale.to_sym
      # NOTE: add locales here in alphabetical order
      when :az, :de, :en, :es, :fr, :id, :ms, :pt, :ru, :vi
        [Object.const_get("Humanize::#{locale.capitalize}"), ' ']
      when :th
        [Humanize::Th, '']
      when :tr
        [Humanize::Tr, ' ']
      when :jp
        [Humanize::Jp, '']
      when :'zh-tw'
        [Humanize::ZhTw, '']
      when :'fr-CH'
        [Humanize::FrCh, ' ']
      else
        raise "Unsupported humanize locale: #{locale}"
      end
    end

    def stringify(parts, sign, spacer)
      output = parts.reverse.join(spacer).squeeze(spacer)
      if locale_is?(:es) && sign
        "#{output}#{spacer}#{sign}"
      elsif sign
        "#{sign}#{spacer}#{output}"
      else
        output
      end
    end

    def locale_is?(locale)
      Humanize.config.default_locale == locale
    end

    # rubocop:disable Metrics/ParameterLists
    def process_decimals(number, locale_class, locale, parts, decimals_as, spacer)
      # rubocop:enable Metrics/ParameterLists
      return unless number.is_a?(Float) || number.is_a?(BigDecimal)

      # Why 15?
      # (byebug) BigDecimal.new(number, 15)
      # 0.8000015e1
      # (byebug) BigDecimal.new(number, 16)
      # 0.8000014999999999e1
      decimal = BigDecimal(number, 15) - BigDecimal(number.to_i)

      _sign, significant_digits, _base, exponent = decimal.split
      return if significant_digits == "0"

      grouping = locale_class::SUB_ONE_GROUPING
      leading_zeroes = [grouping[0]] * exponent.abs
      decimals_as = :digits if leading_zeroes.any?

      decimals_as_words =
        case decimals_as
        when :digits
          digits = significant_digits.chars.map do |num|
            grouping[num.to_i]
          end

          (leading_zeroes + digits).join(spacer)
        when :number
          Humanize.format(significant_digits.to_i, locale:)
        end

      parts.insert(0, decimals_as_words, locale_class::POINT)
    end

    attr_writer :config

    def config
      @config ||= Configuration.new
    end

    def reset_config
      @config = Configuration.new
    end

    def configure
      yield(config)
    end
  end

  class Configuration
    attr_accessor :default_locale, :decimals_as

    def initialize
      @default_locale = :en
      @decimals_as = :digits
    end
  end
end
