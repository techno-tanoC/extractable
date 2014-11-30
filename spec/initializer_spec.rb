# coding: utf-8

require 'spec_helper'

class Test
  prepend Extractable
  def initialize a, b, c
  end
end

describe Extractable::Initializer do
  context "when prepended" do
    it "returns initializing args" do
      expect(Test.new(1, 2, 3).extract).to match [1, 2, 3]
    end

    it "given block, and return yield value" do
      expect(
        Test.new(1, 2, 3).extract do |a, b, c|
          a + b + c
        end
      ).to eq 6

      Test.new(1, 2, 3).match do
        with Test.case(0, 2, 3) do p "wrong" end
        with Test.case(1, 2, 3) do p "correct" end
        with Test.case(0, 2, 3) do p "wrong" end
      end
    end
  end
end
