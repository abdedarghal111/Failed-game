--[[
Este es el script base para cargar todo el programa,
cargar el modulo para ejecutar ciertos sistemas e iniciarlos,
y mas modulos necesarios.
--]]

--Cargar cosas
function love.load()
  execute = require("Resources/executor")
  local r = "Resources/"
  execute(r.."Vector2.lua",r.."core.lua",r.."executor.lua",
          "test.lua")
  core = require("Resources/core")
end

--Loop infinito
function love.draw()
  core.run()
end
