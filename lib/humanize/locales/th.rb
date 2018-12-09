require_relative 'constants/th'

module Humanize
  class Th
    def humanize(number)
      number_groups = [100, 10]
      number_grouping = number_groups.shift
      iteration = 0
      parts = []
      use_and = false
      until number.zero?
        number, remainder = number.divmod(number_grouping)
        unless remainder.zero?
          if iteration.zero? && remainder < (number_grouping / 10)
            use_and = true
          else
            add_grouping(parts, use_and, iteration)
          end

          parts << SUB_ONE_GROUPING[remainder]
        end

        number_grouping = number_groups.shift unless number_groups.empty?
        iteration += 1
      end

      parts
    end

    private

    def conjunction(parts, use_and)
      return '' if parts.empty? && !use_and

      ' และ'
    end

    def add_grouping(parts, use_and, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << "#{grouping}#{conjunction(parts, use_and)}"
    end
  end
end
