local cube = require("Resources/Modules/cube")
local img = love.graphics.newImage("Data/Images/1.png")
local rec = cube.new()
addcoroutine("f",function()
while true do
  love.graphics.draw(img,100,100)
  rec.rotation = rec.rotation + 1
  rec.position.x = rec.position.x + 1
  wait()
  rec:draw()
end
end)
