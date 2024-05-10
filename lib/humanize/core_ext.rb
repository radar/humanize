# frozen_string_literal: true

module Humanize
  def humanize(locale: Humanize.config.default_locale,
               decimals_as: Humanize.config.decimals_as)
    Humanize.format(self,
                    locale:,
                    decimals_as:)
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
