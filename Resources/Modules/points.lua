--[[
Este modulo sera para el renderizado de particulas.
--]]

--La tabla
points = {}

local function createpoints()
  for i = 1,1000 do
    local e = math.random(1,100)
  	points[i] = {math.random(0,x),math.random(0,y),e/10}
  end
end

local function renderpoints()
  for i = 1,100 do
    love.graphics.points(points[i][1],points[i][2],love.graphics.setPointSize(points[i][3]))
  end
end
