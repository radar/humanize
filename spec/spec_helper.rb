require 'rubygems'
require 'humanize'
require 'rspec'
require 'timeout'

RSpec.configure do |config|
  config.around(:each) do |example|
    Timeout.timeout(5, &example)
    Humanize.reset_config
  end
end
