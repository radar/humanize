# frozen_string_literal: true

require_relative 'constants/ms'

module Humanize
  class Ms
    def humanize(number)
      iteration = 0
      parts = []
      until number.zero?
        number, remainder = number.divmod(1000)
        unless remainder.zero?
          add_grouping(parts, iteration)

          parts << SUB_ONE_GROUPING[remainder]
        end

        iteration += 1
      end

      correct_one_thousand(parts)
    end

    def add_grouping(parts, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << grouping
    end

    def correct_one_thousand(parts)
      lots = LOTS.drop(2)
      wrong_1000_re = /(?<=#{lots.join(' |')} )\s*satu ribu|^satu ribu/
      parts = parts.reverse.join(" ").sub(wrong_1000_re, 'seribu')
      parts.split.reverse
    end
  end
end
