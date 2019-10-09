require_relative 'constants/pt'

module Humanize
  class Pt
    def humanize(number)
      iteration = 0
      parts = []
      use_and = false
      until number.zero?
        number, remainder = number.divmod(1000)
        plural = remainder > 1
        unless remainder.zero?
          if iteration.zero? && remainder < 100
            use_and = true
          else
            add_grouping(parts, use_and, iteration, plural)
          end

          parts << SUB_ONE_GROUPING[remainder] unless one_thousand?(remainder, parts)
        end

        iteration += 1
      end

      parts
    end

    private

    def one_thousand?(remainder, parts)
      remainder == 1 && (parts.last.to_s.strip == 'mil' || parts.last.to_s.strip == 'mil e')
    end

    def conjunction(parts, use_and)
      return '' if parts.empty?

      use_and ? ' e' : ', '
    end

    def add_grouping(parts, use_and, iteration, plural)
      grouping = LOTS[iteration]
      return unless grouping

      grouping.sub! 'lhão', 'lhões' if plural

      parts << "#{grouping}#{conjunction(parts, use_and)}"
    end
  end
end
