require_relative 'constants/en'

module Humanize
  class En
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

      parts
    end

    private

    def conjunction(parts, use_and)
      return '' if parts.empty?

      use_and ? ' and' : ','
    end

    def add_grouping(parts, use_and, iteration)
      grouping = LOTS[iteration]
      return unless grouping

      parts << "#{grouping}#{conjunction(parts, use_and)}"
    end
  end
end
