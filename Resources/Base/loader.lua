--[[
Este archivo se encargara de cargar las imagenes, audio para tenerlos listos
para su uso.
--]]
_G.asserts = {
  img = {}
}

--Esta funcion se encarga de empaquetar las imagenes y añadirlas a la tabla
local function addimages(t)
  local img = "Data/Images/"
  for i,v in pairs(t) do
    asserts.img[i] = love.graphics.newImage(img..v..".png")
  end
end

--Se ejecuta la funcion
addimages({1,2,3,4,somefloor = "somefloor"})
