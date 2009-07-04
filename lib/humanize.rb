module Humanize
  LOTS = %w(hundred thousand million billion trillion quadrillion quintrillion sextillion septillion octillion nonitrillon decillion)
  TENS = %w(twenty thirty forty fifty sixty seventy eighty ninety)
  STRANGE = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  ONES = %w(zero one two three four five six seven eight nine ten)
  
  def humanize(with_hypen=false)
    o = parse(self, with_hypen)
    o = "negative " << o if self < 0
    o << decimal_parse if self.is_a?(Float)
    o
  end
  
  def parse(num, with_hyphen)
    num = num.abs
    case num
    when 1..10
      ONES[num]
    when 11..19
      STRANGE[self-11]
    when 20..99
      remainder = self % 10
      [TENS[(self / 10) - 2].to_s, remainder.humanize].join(" ")
    when 100..999999999999999999999999999999
      log = Math.log10(num).floor
      o_remainder = log % 3
      log = (log - o_remainder) if o_remainder != 0 && log > 3
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
    lots = if length > 3
      (length / 3).ceil - 1
    else
      0
    end
    number = [self.parts_of(base).humanize]
    number << " "
    number << LOTS[lots]
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