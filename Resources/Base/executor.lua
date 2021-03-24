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
      return core.add(v)
    end
  end
end

--Se agrega una funcion para ejecutar archivos
local function execute(...)
  local e = {...}
  for _,v in pairs(e) do
    if type(loadfile(love.filesystem.getSource().."/"..v)) ~= "function" then
      local _,pe = loadfile(love.filesystem.getSource().."/"..v)
      error("\n there is an error loading "..v..":\n"..tostring(pe))
    end
    loadfile(love.filesystem.getSource().."/"..v)()
  end
end

--Se hace global la funcion para añadir coroutina
_G.addcoroutine = requirecoroutine
_G.execute = execute

--Se requiere primero para hacerlo funcionar
return execute
