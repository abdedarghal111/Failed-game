local core = require"Resources/core"
local function requirecoroutine(tipo,...)
  if tipo == "F" then
    local t = {...}
    for i,v in pairs(t) do
      if type(loadfile(love.filesystem.getSource().."/"..v)) ~= "function" then
        error("\n there is an error loading "..v..":\n"..
          loadfile(love.filesystem.getSource().."/"..v)
        )
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
_G.InCoroutine = requirecoroutine
