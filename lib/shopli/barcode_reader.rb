class Shopli
  class BarcodeReader
    require 'libdevinput'

    def initialize(path)
      @path = path
    end

    def events_stream
      di = DevInput.new(@path, 24)
      di.to_enum(:each)
    end
  end
end
