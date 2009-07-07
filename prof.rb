require 'rubygems'
require 'ruby-prof'
require 'lib/humanize'
RubyProf.start

require 'bench'
result = RubyProf.stop

# Print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT, 0)