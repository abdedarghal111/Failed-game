local coroutines = {cor = {}}
coroutines.add = function(obj)
  if type(obj) == "function" then
    table.insert(coroutines.cor,coroutine.create(obj))
  else
    error('\n you need add a function to run \n <<In core.lua "7">>')
  end
end
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
coroutines.run = function()
  for i,v in pairs(coroutines.cor) do
    if coroutine.status(v) == "dead" then
      table.remove(coroutines.cor,i)
    elseif coroutine.status(v) == "suspended" then
      coroutine.resume(v)
    end
  end
end
return coroutines
