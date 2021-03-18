--[[
Este modulo es el sistema encargado de ejecución en tiempo real.
Se encarga de hacer que scripts estilo roblox funcionen.
Usa sistema de corutinas
--]]

--Aqui abajo esta la tabla principal del sistema
local coroutines = {cor = {}}

--Funcion para añadir ejecuciones o coroutines
coroutines.add = function(obj)
  if type(obj) == "function" then
    table.insert(coroutines.cor,coroutine.create(obj))
  else
    error('\n you need add a function to run \n <<In Resources/core.lua "11">>')
  end
end

--La funcion wait() reutil, se hace global
_G.wait = function(tiempo)
  if tiempo == nil then
    coroutine.yield()
  else
    local time = love.timer.getTime() + tiempo
    repeat
      coroutine.yield()
    until love.timer.getTime() - time > tiempo
  end
end

--Esta funcion se ejecutara en love.run, para que funcione todo el sistema
coroutines.run = function()
  for i,v in pairs(coroutines.cor) do
    if coroutine.status(v) == "dead" then
      table.remove(coroutines.cor,i)
    elseif coroutine.status(v) == "suspended" then
      coroutine.resume(v)
    end
  end
end

--Este sistema servira para returnearlo y ejecutarlo a la misma vez
return coroutines
