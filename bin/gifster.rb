#!/usr/bin/env ruby

require 'RMagick'
include Magick

ticks = 1000

name = "animated"
name = ARGV[0] unless ARGV[0].nil?

delay = ticks
delay = ARGV[1].to_i * ticks unless ARGV[1].nil?

sources = *Dir["*.png"]

sources.sort do |x, y|
  cx = x[-1, 1].to_i
  cy = y[-1, 1].to_i
  (cx - cy)
end

gif = ImageList.new(*sources)
gif.ticks_per_second = ticks
gif.delay = delay # in ticks
gif.write("#{name}.gif")
