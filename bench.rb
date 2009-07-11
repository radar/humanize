require 'lib/humanize'
# require 'other'
require 'benchmark'
require 'tests'

Benchmark.benchmark do |x|
  x.report do
    100.times { TESTS.each do |x, y|
      x.humanize
    end }
  end
end