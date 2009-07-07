module Humanize
  
  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT
  require File.join(File.dirname(__FILE__), 'lots')
  
  # Tens - with placeholders
  TENS = %w(none ten twenty thirty forty fifty sixty seventy eighty ninety)
  
  # Numbers after 10 are classed as "strange", as their kind are not seen elsewhere.
  STRANGE = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  
  # Count to ten!
  ONES = %w(zero one two three four five six seven eight nine ten)
  
  ZERO_TO_NINETEEN = ONES + STRANGE
  
  def humanize
    @@humanize_cache ||= Array.new(1000)
    num, dec = to_s.split('.', 2).map { |n| n.to_i }
    
    o = []
    if num < 0
      neg = true
      num = -num
    end
    if num == 0
      o << 'zero'
    end
    i = 0
    sets = []
    while num > 0
      num, n = num.divmod(1000)
      sets << n
    end
    sets.reverse!
    size = sets.size
    size_m1 = size - 1
    size_m2 = size - 2
    sets.each_with_index do |set, i|      
      o << "#{three_digits_to_words(set)}#{" #{LOTS[size_m1 - i]}" if size_m1 - i > 0}#{' and' if i == size_m2 && sets[i.succ] < 100}"
    end

    d = []
    if dec
      while dec > 0
        dec, n = dec.divmod(10)
        d << ONES[n]
      end
      d << ' point'
      d.reverse!
    end
    last = o.pop
    "#{'negative ' if neg}#{(r = o.join(', ')).size > 0 ? "#{r} " : ''}#{last}#{d.join(' ')}"
  end
  
  
  
  def three_digits_to_words(num)
    if (r = @@humanize_cache[num])
      return r
    end
    
    t, dig3 = num.divmod(10)
    dig1, dig2 = t.divmod(10)
    
    o = ''
    if dig1 > 0
      o << "#{ONES[dig1]} hundred"
    end
    
    o << ' and ' if ((dig2 | dig3 != 0) && dig1 > 0)
    if dig2 > 1
      o << "#{TENS[dig2]}#{" #{ONES[dig3]}" if dig3 > 0}"
    elsif dig3 | dig2 != 0
      o << ZERO_TO_NINETEEN[dig2 * 10 + dig3]
    end
    @@humanize_cache[num] = o
    o
  end
  
end

class Numeric
  include Humanize
end