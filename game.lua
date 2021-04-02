--print(loadfile(love.filesystem.getSource().."/".."Resources/Executables/test.lua"))
--execute("Resources/Executables/test.lua")
local main = require"Resources/Modules/startscreen"
addcoroutine("f",function()
  while true do
    main.start()
    wait(2)
    main.stop()
    wait(2)
  end
end)
