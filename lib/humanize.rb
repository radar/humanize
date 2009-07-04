module Humanize
  
  # Accommodate for 66-digit long numbers
  LOTS = %w(hundred thousand million billion trillion quadrillion quintrillion sextillion septillion octillion nonillion decillion undecillion duodecillion tredecillion quattuordecillion quindecillion sexdecillion septendecillion octodecillion novemdecillion vigintillion)
  
  # Tens, without the 10.
  TENS = %w(twenty thirty forty fifty sixty seventy eighty ninety)
  
  # Numbers after 10 are classed as "strange", as their kind are not seen elsewhere.
  STRANGE = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  
  # Count to ten!
  ONES = %w(zero one two three four five six seven eight nine ten)
  
  # Accepts humanize method
  def humanize(with_hypen=false)
    o = parse(self, with_hypen)
    o = "negative " << o if self < 0
    o << decimal_parse if self.is_a?(Float)
    o
  end
  
  def parse(num, with_hyphen)
    num = num.abs
    case num        
      when 0..10
        ONES[num]
      when 11..19
        STRANGE[self-11]
      when 20..99
        remainder = self % 10
        a = [TENS[(self / 10) - 2].to_s, remainder.humanize]
        with_hyphen ? a.join("-") : a.join(" ")
      when 100..(("9" * 66).to_i)
        # Calculates the correct number of zeroes, base is 100, 1000, 1000000, 1000000000, etc.
        log = Math.log10(num).floor
        log = (log - log % 3) if log % 3 != 0 && log > 3
        base = "1#{'0' * log}".to_i
        num.extra(base)
      end 
  end
  
  def parts_of(num)
    self / num      
  end
  
  def extra(base)
    remainder = self % base
    length = self.to_s.length.to_f
    lots = length > 3 ? (length / 3).ceil - 1 : 0
    
    number = [self.parts_of(base).humanize]
    number << " " << LOTS[lots]
    if remainder != 0
      if %w(hundred).include?(number.last)
        number << " and " 
      elsif /illion/.match(number.last)
        number << ", "
      else
        number << " "
      end
      number << remainder.humanize
    end
    number.join
  end
  
  # Call this!
  def decimal_parse
    " point " << (self - self.floor).to_s.split(".").last.split("").map { |d| ONES[d.to_i] }.join(" ")
  end
  

end

class Numeric
  include Humanize
end