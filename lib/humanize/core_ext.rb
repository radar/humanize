module Humanize
  def humanize(locale: Humanize.config.default_locale,
               decimals_as: Humanize.config.decimals_as)
    Humanize.format(self,
                    locale: locale,
                    decimals_as: decimals_as)
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
