return function (self,keyIsKeyboardKey) 
local ret = {}
for key,func in pairs(keyIsKeyboardKey) do
	ret[tostring(key)] = {FuncType = func.FuncType, Id = func.Id}
end
return ret
end