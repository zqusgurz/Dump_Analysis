return function (self) 
local k = KeyboardKey.CastFrom(self.KeyType)
local keyConfig = _AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent

---@type FuncKey
local func = keyConfig:GetKeyTable()[k]
if (func == nil) then
	--log("No func: " .. self.KeyType)
	return nil
end

---@type FuncKey
local ret = {FuncType = func.FuncType, Id = func.Id}
return ret
end