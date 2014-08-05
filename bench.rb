require 'benchmark'
require_relative 'lib/humanize'
require_relative 'spec/tests'

Benchmark.benchmark do |x|
  x.report do
    100.times { TESTS.each do |x, y|
      x.humanize
    end }
  end
end