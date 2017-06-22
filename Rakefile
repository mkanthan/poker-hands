
begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  # no rspec available
end

task :poker do
  require_relative './lib/poker_parser'
  PokerParser.new.parse
end