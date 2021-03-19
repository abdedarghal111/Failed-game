local imga = require("Resources/Modules/image")
local img = imga.new(_,_,_,_,asserts.img.somefloor)

addcoroutine("f",function()
while true do
  img.rotation = img.rotation + 1
  img.position.x = img.position.x + 1
  wait()
  img:draw()
end
end)
