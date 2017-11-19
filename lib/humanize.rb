require_relative './humanize/cache'
require_relative './humanize/lots'
require_relative './humanize/words'

module Humanize

  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT


  def humanize(options = {})
    locale = options[:locale] || Humanize.config.default_locale
    decimals_as = options[:decimals_as] || Humanize.config.decimals_as
    num = self
    o = ''
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
      num, r = num.divmod(1000)
      sets << LOTS[locale][i] + (!sets.empty? ? (f ? ' ' + WORDS[locale][:and] : WORDS[locale][:comma]) : '') unless r.zero? || i.zero?
      f = true if i.zero? && r < 100

      sets << SUB_ONE_THOUSAND[locale][r] unless r.zero? || exactly_one_thousand_in_french_or_turkish?(locale, r, sets)
      i = i.succ
    end
    o += sets.reverse.join(' ')

    if self.class == Float
      digits, exp = to_s.split("e-")
      decimals = ("%.#{digits[/\d+$/].length + exp.to_i}f" % self).split(".").last
      has_leading_zeroes = decimals[/^0+/].to_s.length > 0
      decimals_as = :digits if has_leading_zeroes
      decimals_as_words = case decimals_as
                          when :digits then decimals.chars.map{|n| SUB_ONE_THOUSAND[locale][n.to_i] }.join(' ')
                          when :number then decimals.to_i.humanize(:locale => locale)
                          end
      o += ' ' + WORDS[locale][:point] + ' ' + decimals_as_words
    end
    if locale == :id
      lots = LOTS[:id].drop(2)
      wrong_1000_re = /(?<=#{lots.join(" |")} )\s*satu ribu|^satu ribu/
      o.sub!(wrong_1000_re, 'seribu')
    end
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
    (locale == :fr || locale == :tr) && r == 1 && (sets.last.to_s.strip == 'mille' || sets.last.to_s.strip == 'bin')
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
