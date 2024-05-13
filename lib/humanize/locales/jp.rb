# frozen_string_literal: true

require_relative 'constants/jp'

module Humanize
  class Jp
    def humanize(number)
      iteration = 0
      parts = []
      until number.zero?
        number, remainder = number.divmod(10_000)
        unless remainder.zero?
          add_grouping(parts, iteration)
          parts << SUB_ONE_GROUPING[remainder]
        end

        iteration += 1
      end

      parts
    end

    private

    def add_grouping(parts, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << grouping.to_s
    end
  end
end
