module Trait
  #Mixins are dumb
  def self.call(mixin)
    wrapper = Class.new()
    wrapper.include(mixin)
    wrapper.module_exec {
      mixin.private_instance_methods.each { |meth| public meth }
    }
    return wrapper.new
  end
end

#example
#class MyClass
#  @@util = Trait.(SomeMixinClass)
#end
