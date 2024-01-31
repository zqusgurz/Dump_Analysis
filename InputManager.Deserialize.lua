return function (self,keyIsString) 
local ret = {}
for key,func in pairs(keyIsString) do
	ret[KeyboardKey.CastFrom(key)] = {FuncType = func.FuncType, Id = func.Id}
end
return ret
end