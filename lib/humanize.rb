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
    num, dec = to_s.split('.', 2).map { |n| n.to_i }
    
    o = []
    if num == 0
      o << 'zero'
    end
    i = 0
    sets = []
    while num > 0
      sets << num % 1000
      num /= 1000
    end
    sets.reverse!
    size = sets.size
    sets.each_with_index do |set, i|
      # o << 'and' if i == size - 1
      
      o << "#{three_digits_to_words(set)}#{" #{LOTS[size - i - 1]}" if size - 1 - i > 0}"
    end

    d = []
    if dec
      while dec > 0
        d << ONES[dec % 10]
        dec /= 10
      end
      d << ' point'
      d.reverse!
    end
    
    last = o.pop
    "#{o.join(', ')} #{last}#{d.join(' ')}"
  end
  
  
  
  def three_digits_to_words(num, add_and = false)
    dig3 = num % 10
    dig2 = (num / 10) % 10
    dig1 = (num / 100) % 10
    
    o = ''
    if dig1 > 0
      o << "#{ONES[dig1]} hundred"
    end
    
    o << ' and ' if ((dig2 | dig3 != 0) && dig1 > 0) || add_and
    if dig2 > 1
      o << "#{TENS[dig2]}#{" #{ONES[dig3]}" if dig3 > 0}"
    elsif dig3 | dig2 != 0
      o << ZERO_TO_NINETEEN[dig2 * 10 + dig3]
    end
    o
  end
  
end

class Numeric
  include Humanize
end

p 1012.humanize