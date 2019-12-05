require_relative 'constants/es'

module Humanize
  class Es
    def humanize(number)
      iteration = 0
      parts = []
      use_and = false
      million = false
      until number.zero?
        number, remainder = number.divmod(1000)

        unless remainder.zero?
          if iteration.zero? && remainder < 100
            use_and = true
          else
            million = true
            add_grouping(parts, use_and, iteration, remainder)
          end
          parts << check_millions(SUB_ONE_GROUPING[remainder], million) unless exactly_one_thousand?(remainder, parts)
        end

        iteration += 1
      end
      parts
    end

    private

    def exactly_one_thousand?(remainder, parts)
      remainder == 1 && parts.last.to_s.strip == 'mil'
    end

    def check_millions(grouping, million)
      return 'un' if million && grouping == 'uno'

      grouping
    end

    def add_grouping(parts, _use_and, iteration, remainder)
      grouping = LOTS[iteration]
      grouping = 'millones' if grouping == 'millón' && remainder > 1
      return unless grouping

      parts << grouping
    end
  end
end
