module Humanize
  
  # Accommodate for large numbers
  # Big numbers are big: http://wiki.answers.com/Q/What_number_is_after_vigintillion&src=ansTT
  require File.join(File.dirname(__FILE__), 'lots')
  require File.join(File.dirname(__FILE__), 'cache')

  def humanize
    num = self.to_i
    o = ''
    if num < 0
      o += 'negative '
      num = num.abs
    end
    if num.zero?
      o += 'zero'
    else
      sets = []
      i = 0
      f = false
      while !num.zero?
        num, r = num.divmod(1000)
        sets << LOTS[i] + (!sets.empty? ? (f ? ' and' : ',') : '') if !(r.zero? || i.zero?)
        f = true if i.zero? && r < 100
        
        sets << SUB_ONE_THOUSAND[r] if !r.zero?
        i = i.succ
        
      end
      o += sets.reverse.join(' ')
    end
    
    o += ' point ' + self.to_s.split(/\./, 2).last.scan(/./).map { |n| SUB_ONE_THOUSAND[n.to_i] }.join(' ') if self.class == Float
    o
  end
end

class Numeric
  include Humanize
end