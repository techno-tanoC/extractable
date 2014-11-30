# coding: utf-8

require 'extractable/match_env'

module Extractable::Initializer
  def initialize *args
    @initializing_args = args
    super
  end
end

module Extractable::PatternMatch
  def extract
    block_given? ? yield(*@initializing_args) : @initializing_args
  end

  def match &block
    klass = self.class
    tgt = extract
    env = ::Extractable::MatchEnv.new(self, klass, tgt)
    ::Kernel.catch(:exit_match) do
      env.instance_eval(&block)
    end
  end
end

module Extractable::Case
  def case *pats
    [self, pats]
  end
end
