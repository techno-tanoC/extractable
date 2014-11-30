require "extractable/version"
Dir["#{File.dirname(__FILE__)}/extractable/*.rb"].each do |path|
  require "extractable/#{File.basename(path, '.rb')}"
end

module Extractable
  def self.included klass
    klass.include Extractable::PatternMatch
    klass.prepend Extractable::Initializer
    klass.extend Extractable::Case
  end
end
