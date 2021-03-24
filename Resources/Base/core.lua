--[[
Este modulo es el sistema encargado de ejecución en tiempo real.
Tambien es encargado del delta time
Se encarga de hacer que scripts estilo roblox funcionen.
Usa sistema de corutinas
--]]

--Aqui abajo esta la tabla principal del sistema y require modulos necesarios
local coroutines = {cor = {},delete = {}}
local id,checkid = require"Resources/Modules/id"

--funcion para chequear y añadir a la tabla
local function add(obj)
  local _id = id.createid()
  if not id.checktableid(coroutines.cor,_id) then
    coroutines.cor[_id] = coroutine.create(obj)
    return _id
  else
    return add(obj)
  end
end

--Funcion para añadir ejecuciones o coroutines con sus propios id
coroutines.add = function(obj)
  if type(obj) == "function" then
    return add(obj)
  else
    error('\n you need add a function to run \n <<In Resources/Base/core.lua "11">>')
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

--funcion que devuelve el valor deseado multiplicandolo por cada frame en 1 segundo
_G._dt = function(num)
  return num * dt
end

--Funcion del deltatime
local function dt_update()
  dt = love.timer.getDelta()
end

--Esta funcion se ejecutara en love.run, para que funcione todo el sistema
coroutines.run = function()
  dt_update()
  for i,v in pairs(coroutines.cor) do
    if coroutine.status(v) == "dead" then
      coroutines.cor[i] = nil
    elseif coroutine.status(v) == "suspended" then
      coroutine.resume(v)
    end
  end
end

--Este sistema servira para returnearlo y ejecutarlo a la misma vez
return coroutines
