return function (self,func) 
---@type table<KeyboardKey, FuncKey>
local settings = self:GetKeyTable()
for key,f in pairs(settings) do
	if (f.FuncType == func.FuncType and f.Id == func.Id) then
		settings[key] = nil
	end
end
end