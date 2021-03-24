--[[
this is the main screen module
--]]

--variables creation
local img = require("Resources/Modules/image")
local x,y = love.graphics.getDimensions()
local _x,_y = asserts.img.cohete:getDimensions();_x,_y = _x*3,_y*4
local image = img.new(x/2-(_x/2),y/2-(_y/2),_x,_y,asserts.img.cohete)
local _x,_y = asserts.img.title:getDimensions();
local text = img.new(x/2-_x,y/2,_x,_y,asserts.img.title)
image.rotation = 15

--loop variables
local x1 = image.position.y;local y1 = 0;sin = math.sin
local x2 = text.rotation;local y2 = 0;cos = math.cos
local function r(e) return e/360*math.pi end

--functions
cor = addcoroutine("f",function()
  while true do
    wait()
    image.position.y = x1 + 50 * sin(r(y1))
    text.rotation = x2 + 25 * cos(r(y2))
    y1 = y1 + _dt(60);y2 = y2 + _dt(60)
    image:draw()
    text:draw()
  end
end)
