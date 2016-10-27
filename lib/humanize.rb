module Humanize

  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT
  require File.join(File.dirname(__FILE__), 'lots')
  require File.join(File.dirname(__FILE__), 'words')
  require File.join(File.dirname(__FILE__), 'cache')

  def humanize(options = {})
    locale = options[:locale] || Humanize.config.default_locale
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

        sets << SUB_ONE_THOUSAND[locale][r] if !r.zero?
        i = i.succ

      end
      o += sets.reverse.join(' ')
    end
    o += ' ' + WORDS[locale][:point] + ' ' + self.to_s.split(/\./, 2).last.scan(/./).map { |n| SUB_ONE_THOUSAND[locale][n.to_i] }.join(' ') if self.class == Float
    o
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

  class Configuration
    attr_accessor :default_locale

    def initialize
      @default_locale = :en
    end
  end

end

class Numeric
  include Humanize
end
