# coding: utf-8

class BindingModule < ::Module
end

class Extractable::MatchEnv
  def initialize ctx, klass, tgt
    @ctx = ctx
    @klass = klass
    @tgt = tgt
  end

  def with patterns, &block
    ctx = @ctx
    klass = @klass
    tgt = @tgt

    pat_klass = patterns.first
    pats = patterns.last

    if pat_klass == klass and pats === tgt
      ret = ctx.instance_eval(&block)
      ::Kernel.throw(:exit_match, ret)
    else
      nil
    end
  end
end
