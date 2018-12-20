require_relative 'constants/fr'

module Humanize
  class Fr
    def humanize(number)
      iteration = 0
      parts = []
      until number.zero?
        number, remainder = number.divmod(1000)
        unless remainder.zero?
          add_grouping(parts, iteration)

          parts << SUB_ONE_GROUPING[remainder] unless exactly_one_thousand?(remainder, parts)
        end

        iteration += 1
      end

      parts
    end

    private

    def exactly_one_thousand?(remainder, parts)
      remainder == 1 && parts.last.to_s.strip == 'mille'
    end

    def add_grouping(parts, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << grouping
    end
  end
end
