require_relative 'constants/vi'

module Humanize
  class Vi
    def humanize(number)
      iteration = 0
      parts = []
      until number.zero?
        number, remainder = number.divmod(1000)

        if !remainder.zero?
          parts << LOTS[iteration] if iteration.positive?
          parts << SUB_ONE_GROUPING[remainder]
          add_linked_word(parts, remainder) if number.positive?
        elsif iteration.positive? && (iteration % 3).zero?
          parts << LOTS[3]
        end

        iteration += 1
      end

      parts
    end

    private

    def add_linked_word(parts, remainder)
      if remainder < 10
        parts << LINKED_WORDS[0]
      elsif remainder < 100
        parts << LINKED_WORDS[1]
      end
    end
  end
end
