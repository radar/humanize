require_relative './humanize/cache'
require_relative './humanize/lots'
require_relative './humanize/words'

module Humanize

  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT


  def humanize(options = {})
    locale = options[:locale] || Humanize.config.default_locale
    decimals_as = options[:decimals_as] || Humanize.config.decimals_as
    number_grouping = WORDS[locale][:group_by]
    num = self
    o = ''

    if num.class == Float
      if (inf = num.infinite?)
        if inf == 1
          return WORDS[locale][:infinity]
        else
          return "#{WORDS[locale][:negative]} #{WORDS[locale][:infinity]}"
        end
      elsif num.nan?
        return WORDS[locale][:undefined]
      end
    end

    if num.zero?
      return WORDS[locale][:zero]
    elsif num < 0
      o += WORDS[locale][:negative] + ' '
      num = num.abs
    end

    sets = []
    i = 0
    f = false
    until num.zero?
      num, r = num.divmod(number_grouping)
      unless r.zero?
        if !i.zero?
          conjunction = if !sets.empty?
                          (f ? ' ' + WORDS[locale][:and] : WORDS[locale][:comma])
                        else
                          ''
                        end
          sets << LOTS[locale][i] + conjunction
        else
          f = true if r < (number_grouping/10)
        end

        unless exactly_one_thousand_in_french_or_turkish?(locale, r, sets)
          sets << SUB_ONE_GROUPING[locale][r]
        end
      end
      i = i.succ
    end
    o += sets.reverse.join(' ')

    if self.class == Float
      digits, exp = to_s.split("e-")
      decimals = ("%.#{digits[/\d+$/].length + exp.to_i}f" % self).split(".").last
      has_leading_zeroes = decimals[/^0+/].to_s.length > 0
      decimals_as = :digits if has_leading_zeroes
      decimals_as_words = case decimals_as
                          when :digits
                            decimals.chars.map do |n|
                              SUB_ONE_GROUPING[locale][n.to_i]
                            end.join(' ')
                          when :number
                            decimals.to_i.humanize(:locale => locale)
                          end
      o += ' ' + WORDS[locale][:point] + ' ' + decimals_as_words
    end
    o = correct_one_thousand_in_indonesian(locale, o)
    o.squeeze(' ')
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

  def exactly_one_thousand_in_french_or_turkish?(locale, r, sets)
    if r == 1
      if (thousand = sets.last.to_s.strip) == 'mille' && locale == :fr
        return true
      elsif thousand == 'bin' && locale == :tr
        return true
      end
    end
    return false
  end

  def correct_one_thousand_in_indonesian(locale, o)
    if locale == :id
      lots = LOTS[:id].drop(2)
      wrong_1000_re = /(?<=#{lots.join(" |")} )\s*satu ribu|^satu ribu/
      o.sub(wrong_1000_re, 'seribu')
    else
      o
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
