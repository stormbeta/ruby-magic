# TODO: Make this a real project

# Function composition helper for instance methods
# Usage: M.METHOD(ARGS). ...
module M
  def self.method_missing(name, *args)
    Magic.new(name,args)
  end

  class Magic
    def initialize(name, args)
      @p = [lambda { |obj|
        obj.send(name.to_sym, *args)
      }]
    end

    def call(obj)
      @p.inject(obj) { |recv, func| func.(recv) }
    end

    def method_missing(name, *args)
      @p.push(lambda { |obj|
        obj.send(name.to_sym, *args)
      })
      return self
    end

    def to_proc
      lambda { |obj| call(obj) }
    end
  end
end
