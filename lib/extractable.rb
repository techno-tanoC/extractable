require "extractable/version"
Dir["#{File.dirname(__FILE__)}/extractable/*.rb"].each do |path|
  require "extractable/#{File.basename(path, '.rb')}"
end

module Extractable
  include Initializer

  def self.prepended klass
    klass.extend Case
  end
end
