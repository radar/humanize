require_relative 'constants/th'

module Humanize
  class Th
    def humanize(number, million_level = 1)
      if number >= 10_000_000
        number, remainder = number.divmod(1_000_000)
        million_parts = humanize(number, million_level + 1)
        sub_million_parts = million_humanize(remainder)
        sub_million_parts << " " << (MILLION * million_level) << million_parts.reverse
      else
        million_humanize(number)
      end
    end

    def million_humanize(number)
      number_groups = [100, 10]
      number_grouping = number_groups.shift
      iteration = 0
      parts = []
      until number.zero?
        number, remainder = number.divmod(number_grouping)
        unless remainder.zero?
          add_grouping(parts, iteration) unless iteration.zero? && remainder < (number_grouping / 10)
          parts << SUB_ONE_GROUPING[remainder]
        end

        number_grouping = number_groups.shift unless number_groups.empty?
        iteration += 1
      end

      parts
    end

    private

    def add_grouping(parts, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << grouping
    end
  end
end
