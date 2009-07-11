require 'lib/humanize'
# require 'other'
require 'benchmark'
require 'tests'

Benchmark.benchmark do |x|
  x.report do
    100.times { @tests.each do |x, y|
      x.humanize
    end }
  end
end