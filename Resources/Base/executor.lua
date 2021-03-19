--[[
Este es el ejecutador que se encarga de ejecutar archivos y funciones,
asi haciendo mas facil empaquetar esos comandos y mandarlos al nucleo.
]]

--Se requiere el nucleo
local core = require"Resources/Base/core"

--La funcion para empaquetar
local function requirecoroutine(tipo,...)
  if tipo ~= "f" and tipo ~= "F" then
    error('\n You dont put the type of coroutine("f" or "F").')
  end
  if tipo == "F" then
    local t = {...}
    for i,v in pairs(t) do
      if type(loadfile(love.filesystem.getSource().."/"..v)) ~= "function" then
        error("\n there is an error loading "..v..":\n"..
          loadfile(love.filesystem.getSource().."/"..v))
      end
      core.add(function()
      loadfile(love.filesystem.getSource().."/"..v)()
    end)
    end
  elseif tipo == "f" then
    local t = {...}
    for i,v in pairs(t) do
      core.add(v)
    end
  end
end

--Se hace global
_G.addcoroutine = requirecoroutine

--Se requiere primero para hacerlo funcionar
return function (...) e = {...}
  for _,v in pairs(e) do dofile(love.filesystem.getSource().."/"..v)end
end
