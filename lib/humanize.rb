module Humanize
  
  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT
  require File.join(File.dirname(__FILE__), 'lots')
  require File.join(File.dirname(__FILE__), 'cache')

  def humanize
    num, dec = to_s.split(/\./, 2).map { |n| n.to_i }
    
    o = []
    if num < 0
      neg = true
      num = -num
    end
    if num == 0
      o << 'zero'
    end
    i = 0
    f = num % 1000
    while num > 0
      num, n = num.divmod(1000)
      o << "#{SUB_ONE_THOUSAND[n]}#{LOTS[i]}"
      i += 1
    end
    o.reverse!
    if i > 1 && f < 100
      o[-2] << ' and'
    end
    
    d = []
    if dec
      while dec > 0
        dec, n = dec.divmod(10)
        d << SUB_ONE_THOUSAND[n]
      end
      d << ' point'
      d.reverse!
    end
    last = o.pop
    "#{'negative ' if neg}#{(r = o.join(', ')).size > 0 ? "#{r} " : ''}#{last}#{d.join(' ')}"
  end
end

class Numeric
  include Humanize
end