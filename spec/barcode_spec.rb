require_relative 'spec_helper'

describe Shopli::Barcode do
  describe '.to_s' do
    it 'returns the barcode figure' do
      b = Shopli::Barcode.new 123456
      expect(b.to_s).to eq '123456'
    end
  end

  def generate_events(code)
    press = DevInput::Event.new 1,0,1,code, 1
    release = DevInput::Event.new 1,0,1,code, 0
    scan = DevInput::Event.new 1,0,4,4, 0
    [scan, press, release]
  end

  let(:barcode1_events) do
    [
      (2..10).map { |i| generate_events(i) },
      generate_events(28)
    ].flatten
  end
  let(:barcode2_events) do
    [
      (2..10).map { |i| generate_events(12 - i) },
      generate_events(28)
    ].flatten
  end


  describe '.read' do
    it 'finds barcodes' do
      events = [barcode1_events, barcode2_events].flatten
      barcodes = Shopli::Barcode.read(events).to_a
      expect(barcodes).to have(2).barcodes
    end
  end
end
