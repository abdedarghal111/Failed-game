--[[
Este es el script base para cargar todo el programa,
cargar el modulo para ejecutar ciertos sistemas e iniciarlos,
y mas modulos necesarios.
--]]

--Cargar cosas
function love.load()
  execute = require("Resources/Base/executor")
  local r = "Resources/Base/"
  execute(r.."Vector2.lua",r.."core.lua",r.."executor.lua",
          "test.lua")
  core = require("Resources/Base/core")
end

--Loop infinito
function love.draw()
  core.run()
end