module Humanize
  LOTS = %w(hundred thousand million billion trillion quadrillion quintrillion sextillion septillion octillion nonitrillon decillion)
  TENS = %w(twenty thirty forty fifty sixty seventy eighty ninety)
  STRANGE = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  ONES = %w(zero one two three four five six seven eight nine ten)
  
  def parse(num)
    case num
    when 1..10
      ONES[self]
    when 11..19
      STRANGE[self-11]
    when 20..99
      remainder = self % 10
      [TENS[(self / 10) - 2].to_s, remainder.humanize].join(" ")
    
    # I feel as though after this point I am repeating myself.
    # Need to find way to find what the base is for the number.
    when 100..999
      base = 100
      num.extra(base)
    when 1000..999999
      base = 1000
      num.extra(base)
    when 1000000..999999999
      base = 1000000
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
    number = [self.parts_of(base).humanize, LOTS[lots]]
    number += ["and", remainder.humanize] if remainder != 0
    number.join(" ")
  end
  
  def humanize
    parse(self)
  end
end

class Numeric
  include Humanize
end