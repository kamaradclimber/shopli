class Shopli
  class Mode

    attr_accessor :mode

    def ==(other)
      other && @mode == other.mode
    end

    def initialize(mode)
      @mode = mode
    end

  end
end
