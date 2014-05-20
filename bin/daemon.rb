#!/usr/bin/env ruby

require_relative '../lib/shopli.rb'


reader = Shopli::BarcodeReader.new '/dev/input/by-id/usb-1130_USB-TMU-V1-event-kbd'

device = Shopli::Device.new

device.read(reader.events_stream)
