# coding: utf-8

require 'extractable/proxy'

module Extractable::Initializer
  def initialize *args
    @initializing_args = args
    super
  end

  def extract
    block_given? ? yield(*@initializing_args) : @initializing_args
  end

  def match
  end
end
