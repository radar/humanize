require 'rubygems'
require 'ruby-prof'
require 'lib/humanize'
RubyProf.start

444333222111999777666555444333222111999777666555444333221111112176514321007310444333222111999777666555444333222111999777666555444333221111112176514321007310.humanize

result = RubyProf.stop

# Print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT, 0)