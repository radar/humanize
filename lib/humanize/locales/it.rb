require_relative 'constants/it'

module Humanize
  class It
    def humanize(number)
      iteration = 0
      parts = []
      use_and = false
      until number.zero?
        number, remainder = number.divmod(1000)
        if remainder > 0
          add_grouping(parts, use_and, iteration)
          parts << SUB_ONE_GROUPING[remainder]
        end

        iteration += 1
      end
      
      used_lots = LOTS & parts.map {|part| part.delete(',')}.compact
      used_lots.each do |lot|
        i = (parts.index("#{lot},") || parts.index("#{lot}"))
        prefix = parts[i+1]
        parts -= [prefix]
        
        parts[i] = if lot == LOTS[1]
          prefix == SUB_ONE_GROUPING[1] ? "mille" : "#{prefix}#{lot}"
        else
          plural = lot[0...-1] + 'i'
          prefix == SUB_ONE_GROUPING[1] ? "un #{lot}" : "#{prefix} #{plural}"
        end

        parts[i] += ',' if i + 1 != parts.size
      end
      
      parts
    end

    private

    def conjunction(parts, use_and)
      return '' if parts.empty?
      use_and ? ' e' : ','
    end

    def add_grouping(parts, use_and, iteration)
      grouping = LOTS[iteration]
      return unless grouping
      
      parts << "#{grouping}#{conjunction(parts, use_and)}"
    end
    
  end
end
