require 'bigdecimal'
require_relative './humanize/cache'
require_relative './humanize/lots'
require_relative './humanize/words'

module Humanize

  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT


  def humanize(locale: Humanize.config.default_locale,
               decimals_as: Humanize.config.decimals_as)

    if self.class == Float
      if infinity = self.infinite?
        if infinity == 1
          return WORDS[locale][:infinity]
        else
          return "#{WORDS[locale][:negative]} #{WORDS[locale][:infinity]}"
        end
      elsif self.nan?
        return WORDS[locale][:undefined]
      end
    end

    number = self
    sign = []
    if number.zero?
      return WORDS[locale][:zero]
    elsif number < 0
      sign << WORDS[locale][:negative]
      number = number.abs
    end

    number_grouping = WORDS[locale][:group_by]
    human_ary = []
    iteration = 0
    use_and = false
    until number.zero?
      number, remainder = number.divmod(number_grouping)
      unless remainder.zero?
        if iteration.zero?
          use_and = true if remainder < (number_grouping/10)
        else
          conjunction = if human_ary.empty?
                          ''
                        else
                          (use_and ? ' ' + WORDS[locale][:and] : WORDS[locale][:comma])
                        end
          human_ary << LOTS[locale][iteration] + conjunction
        end

        unless exactly_one_thousand_in_french_or_turkish?(locale, remainder, human_ary)
          human_ary << SUB_ONE_GROUPING[locale][remainder]
        end
      end
      iteration = iteration.next
    end

    if self.class == Float
      digits, exp = to_s.split("e-")
      decimals = format("%.#{digits[/\d+$/].length + exp.to_i}f", self).split(".").last
      has_leading_zeroes = decimals[/^0+/].to_s.length > 0
      decimals_as = :digits if has_leading_zeroes
      decimals_as_words = case decimals_as
                          when :digits
                            decimals.chars.map do |num|
                              SUB_ONE_GROUPING[locale][num.to_i]
                            end.join(' ')
                          when :number
                            decimals.to_i.humanize(:locale => locale)
                          end
      human_ary.insert(0, decimals_as_words, WORDS[locale][:point])
    end

    human_ary += sign
    humanized = human_ary.reverse.join(' ')
    correct_one_thousand_in_indonesian(locale, humanized)
    humanized.squeeze(' ')
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

private

  def exactly_one_thousand_in_french_or_turkish?(locale, remainder, human_ary)
    if remainder == 1
      if (thousand = human_ary.last.to_s.strip) == 'mille' && locale == :fr
        return true
      elsif thousand == 'bin' && locale == :tr
        return true
      elsif thousand == 'min' && locale == :az
        return true
      end
    end
    return false
  end

  def correct_one_thousand_in_indonesian(locale, humanized)
    if locale == :id
      lots = LOTS[:id].drop(2)
      wrong_1000_re = /(?<=#{lots.join(" |")} )\s*satu ribu|^satu ribu/
      humanized.sub!(wrong_1000_re, 'seribu')
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

class Integer
  include Humanize
end

class Float
  include Humanize
end

class BigDecimal
  include Humanize
end
