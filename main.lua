function love.load()
  local function run(...) e = {...}
    for _,v in pairs(e) do dofile(love.filesystem.getSource().."/"..v)end
  end local r = "Resources/"
  run(
    r.."Vector2.lua",r.."core.lua",r.."executor.lua","test.lua"
  )
  core = require("Resources/core")
end

function love.draw()
  core.run()
end
