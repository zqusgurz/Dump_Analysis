return function (self) 
---@type table<KeyboardKey, FuncKey>
local funcKeyMapped = _InputManager.FuncKeyMapped
table.clear(self.TempKeySettings)
for key,func in pairs(funcKeyMapped) do
	self.TempKeySettings[key] = {FuncType = func.FuncType, Id = func.Id}
end
end