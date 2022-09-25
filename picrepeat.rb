#picrepeat
require 'date'
require 'RMagick'
include Magick

file ="pic/img.png"

width = 2
height = 2

image = Image.read(file).first


newimg_width = image.columns * width 
newimg_height = image.rows * height

newimg = Image.new(newimg_width, newimg_height)

newimg.composite!(image,0,0,OverCompositeOp)

dt = Date.today
newimg.write("./result/" + dt.year.to_s + dt.month.to_s + dt.day.to_s + ('a'..'Z').to_a.shuffle[0..7].join + ".png")