class Shopli
  class Device

    attr_reader :current_mode

    TRASH_MODE = Mode.new 'trash'
    SHOP_MODE  = Mode.new 'shop'

    def initialize
      @current_mode = TRASH_MODE
    end

    def read(stream)
      Barcode.read(stream).each do |barcode|
        process barcode
      end
    end


    private
    def process(barcode)
      puts "#{Time.now.to_i} #{barcode.to_s}"
    end


  end
end
