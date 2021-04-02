--[[
este es el modulo de la pantalla principal
--]]

--variables creation
local tab = {}
local stars = require("Resources.Modules.stars")
local img = require("Resources/Modules/image")
local x,y = love.graphics.getDimensions()
local _x,_y = asserts.img.cohete:getDimensions();_x,_y = _x*3,_y*4
local image = img.new(x/2-(_x/2),y/2-(_y/2),_x,_y,asserts.img.cohete)
local _x,_y = asserts.img.title:getDimensions();
local text = img.new(x/2-_x,y/2,_x,_y,asserts.img.title)
local working = false
image.rotation = 15
estrellas = stars.create()
local function r(e) return e/360*math.pi end
local cos = math.cos;local sin = math.sin

--function de iniciar el loop
function tab.start()
  working = true
  local x1 = image.position.y;local y1 = 0
  local x2 = text.rotation;local y2 = 0
  addcoroutine("f",function()
    repeat
      wait()
      image.position.y = x1 + 50 * sin(r(y1))
      text.rotation = x2 + 25 * cos(r(y2))
      y1 = y1 + _dt(60);y2 = y2 + _dt(60)
      stars.render(estrellas)
      image:draw()
      text:draw()
    until not working
  end)
end

--funcion de parar el loop
function tab.stop()
  if working then
    working = false
  else
    error("\n Ya esta apagada, no se puede apagar 2 veces")
  end
end

--devolver la tabla
return tab
