require_relative 'constants/fr_ch'

module Humanize
  class FrCh
    def humanize(number)
      iteration = 0
      parts = []
      until number.zero?
        number, remainder = number.divmod(1000)
        unless remainder.zero?
          add_grouping(parts, iteration, remainder)

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

    def plural_for_lots(remainder, word, iteration)
      if remainder > 1 && iteration >= 2
        "#{word}s"
      else
        word
      end
    end

    def add_grouping(parts, iteration, remainder)
      grouping = plural_for_lots(remainder, LOTS[iteration], iteration)
      return unless grouping

      parts << grouping
    end
  end
end
