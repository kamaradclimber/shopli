class Shopli
  class Barcode

    BARCODE_SIZE = 13

    def ==(other)
      other && @barcode == other.barcode
    end

    def self.read(events)
      events.lazy.select do |event|
        is_release = (event.type == 1) && (event.value_str.eql? 'Release')
        is_release
      end.lazy.slice_before do |event|
        event.code_str.eql? 'Enter'
      end.lazy.map do |cons_events|
        cons_events.reject { |e| e.code_str.eql? 'Enter' }
      end.lazy.reject do |cons_events|
        cons_events.empty?
      end.map do |cons_events|
        barcode = cons_events.map { |e| e.code_str }.join.to_i
        Barcode.new barcode
      end
    end

    def initialize(barcode)
      @barcode = barcode
    end

    def to_s
      @barcode.to_s
    end

  end
end
