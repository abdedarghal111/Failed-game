--[[
Este modulo sera para el renderizado de particulas.
--]]
local stars = {}

function stars.create()
  local t = {};local x,y = love.graphics.getDimensions()
  for i = 1,500 do
    local e = math.random(1,40)
  	t[i] = {math.random(0,x),math.random(0,y),e/10}
  end
  return t
end

function stars.render(t)
  for i = 1,#t do
    love.graphics.points(t[i][1],t[i][2],love.graphics.setPointSize(t[i][3]))
  end
end

return stars
