local function e()
  for i = 1,1000 do
    print(vector2.new(i,i*2))
    wait()
  end
end
InCoroutine("f",e)
