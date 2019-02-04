require_relative 'constants/ru'

module Humanize
  class Ru
    def humanize(number)
      iteration = 0
      parts = []
      use_and = false
      until number.zero?
        number, remainder = number.divmod(1000)
        unless remainder.zero?
          if iteration.zero? && remainder < 100
            use_and = true
          else
            add_grouping(parts, use_and, iteration)
          end

          parts << SUB_ONE_GROUPING[remainder]
        end

        iteration += 1
      end

      correct_lots(parts)
    end

    private

    def conjunction(parts, use_and)
      return '' if parts.empty? || !use_and

      ', '
    end

    def add_grouping(parts, use_and, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << "#{grouping}#{conjunction(parts, use_and)}"
    end

    def correct_lots(parts)
      parts = parts.reverse.join(' ').squeeze(' ')
      SPECIFIC_LOTS.each do |wrong, right|
        parts = parts.sub(wrong, right) if parts.include?(wrong)
      end

      parts.split(' ').reverse
    end
  end
end
