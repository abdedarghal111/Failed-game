--[[
Este sera el modulo de una imagen, servira para llamarlo como si fuera un object.
Esta es la tabla con las funciones y caracteristicas propias. Tambien tendra
funciones de renderizado y caracteristicas necesarias.
--]]
local image = {
  position = vector2.new(),
  size = vector2.new(100,100),
  image = nil,
  rotation = 0,
  candraw = true,
  rotate = function(self)
    return self.rotation/360*math.pi
  end,
  draw = function(self)
    if self.candraw then
      love.graphics.translate(self.position.x + self.size.x/2,self.position.y + self.size.y/2)
      love.graphics.rotate(self:rotate())
      love.graphics.translate(-self.size.x/2,-self.size.y/2)
      local x,y = self.img:getDimensions()
      love.graphics.draw(self.img,0,0,0,self.size.x/x,self.size.y/y)
      love.graphics.origin()
    end
  end
}

--Sirve para crear una nueva imagen
function image.new(x,y,px,py,img,candraw)
  local e = {}
  for i,v in pairs(image) do
    e[i] = v
  end
  e.position.x = x or 0
  e.position.y = y or 0
  e.size.x = px or 100
  e.size.y = py or 100
  e.img = img or nil
  e.candraw = candraw == nil and true or candraw
  return e
end

--devuelve el modulo
return image
