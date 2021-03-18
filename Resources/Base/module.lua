local cube = {
  position = vector2.new(),
  size = vector2.new(100,100),
  rotation = 0,
  rotate = function(self,num)
    self.rotation = num/360*math.pi
  end,
  draw = function(self)
    love.graphics.translate(self.position.x + self.size.x/2,self.position.y + self.size.y/2)
    love.graphics.rotate(self.rotation)
    love.graphics.translate(-self.size.x/2,-self.size.y/2)
    love.graphics.rectangle("fill",0,0,self.size.x,self.size.y)
  end
}
function cube.new()
  local e = {}
  for i,v in pairs(cube) do
    e[i] = v
  end
  return e
end
return cube
