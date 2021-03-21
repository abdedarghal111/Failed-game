--[[
Este archivo se encargara de cargar las imagenes, audio y empaquetarlos en una
tabla para tenerlos listos para su uso.
--]]
_G.asserts = {
  img = {}
}

--Esta funcion se encarga de empaquetar las imagenes u audio y añadirlas a la tabla
local function addasserts(t,table)
  local e = love.filesystem.getDirectoryItems(t)
  for i,v in pairs(e) do
    local i = v
    local v = string.sub(v,1,#v - 4)
    asserts[table][v] = love.graphics.newImage(t.."/"..i)
  end
end

--Se ejecuta la funcion con las direcciones necesarias
addasserts("Data/Images","img")
