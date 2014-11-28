module Extractable
  class Matcher
    def initialize *args
      @args = args
      @flag = false
    end

    def pattern pats, &block
      if @flag then return end
      if @args.size == pats.size
        is_match =
          @args.zip(pats).all? do |arg, pat|
            if pat.kind_of?(Symbol)
              true
            else
              arg === pat
            end
          end
        if is_match
          @flag = true
        else
          return
        end
      end
    end
  end

  module Initializer
    def initialize *args
      self.class.class_eval do
        define_method(:extract) do |&block|
          if block
            block.(*args)
          else
            args
          end
        end

        define_method(:match) do |&block|
          Matcher.new(*args).instance_eval(&block)
        end
      end
      super(*args)
    end
  end

  def self.included klass
    klass.instance_eval do
      self.prepend Initializer
    end
  end
end

class Student
  include Extractable

  def initialize a, b
  end
end

s = Student.new("piyo", "tyun")

z = "nya"

s.extract do |x, y|
  p(x * 2 + y * 2 + z * 2)
end

p s.extract

#s.match do
#  Student.case("hey", :x) do end
#  Student.case("piyo", truthy) do end
#  _ do end
#end
