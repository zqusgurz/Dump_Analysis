return function (self,prefix) 
local value = self:HandleUOL()
log(string.format("%s%s: %s", prefix, self.Name, value:_GetValue_String()))
for k,v in pairs(value.Children) do
	---@type WzObject
	local obj = v
	obj:Print(prefix .. "  ")
end
end