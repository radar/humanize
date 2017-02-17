require_relative './humanize/cache'
require_relative './humanize/lots'
require_relative './humanize/words'

module Humanize

  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT


  def humanize(options = {})
    locale = options[:locale] || Humanize.config.default_locale
    decimals_as = options[:decimals_as] || Humanize.config.decimals_as
    num = self.to_i
    o = ''
    if num < 0
      o += WORDS[locale][:negative] + ' '
      num = num.abs
    end
    if num.zero?
      o += WORDS[locale][:zero]
    else
      sets = []
      i = 0
      f = false
      while !num.zero?
        num, r = num.divmod(1000)
        sets << LOTS[locale][i] + (!sets.empty? ? (f ? ' ' + WORDS[locale][:and] : WORDS[locale][:comma]) : '') if !(r.zero? || i.zero?)
        f = true if i.zero? && r < 100

        sets << SUB_ONE_THOUSAND[locale][r] if !r.zero? && !exactly_one_thousand_in_french_or_turkish?(locale, r, sets)
        i = i.succ

      end
      o += sets.reverse.join(' ')
    end
    if self.class == Float
      decimals = self.to_s.split(/\./, 2).last
      decimals_as_words = case decimals_as
                          when :digits then decimals.scan(/./).map { |n| SUB_ONE_THOUSAND[locale][n.to_i] }.join(' ')
                          when :number then decimals.to_i.humanize(:locale => locale)
                          end
      o += ' ' + WORDS[locale][:point] + ' ' + decimals_as_words
    end
    o.gsub(/ +/, ' ')
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

class Numeric
  include Humanize
end
