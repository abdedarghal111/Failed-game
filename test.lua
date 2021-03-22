local img = require("Resources/Modules/image")
local x,y = love.graphics.getDimensions()
local _x,_y = asserts.img.cohete:getDimensions();_x,_y = _x*3,_y*4
local image = img.new(x/2-(_x/2),y/2-(_y/2),_x,_y,asserts.img.cohete)
local _x,_y = asserts.img.title:getDimensions();
local text = img.new(x/2,y/2,_x,_y,asserts.img.title)
image.rotation = 15
addcoroutine("f",function()
  while true do
    wait()
    image:draw()
    text:draw()
  end
end)
