#!/usr/bin/env ruby

require_relative '../lib/shopli.rb'


reader = Shopli::BarcodeReader.new '/dev/input/by-id/usb-1130_USB-TMU-V1-event-kbd'

Shopli::Barcode.read(reader.events_stream).each do |barcode|
  puts "#{Time.now.to_i} #{barcode.to_s}"
end
