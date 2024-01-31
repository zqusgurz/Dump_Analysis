return function (self,path) 
local paths = _UtilLogic:Split(path, "/")

---@type WzObject
local current = self
--if (self.Type ~= _WzVariantType.Canvas and self.Type ~= _WzVariantType.Property) then
if (self.Type ~= 8 and self.Type ~= 0) then
	current = current.Parent
end
for i=1, #paths do
	if (current == nil) then
		return nil
	end
	if (paths[i] == "..") then
		current = current.Parent
	else
		current = current.Children[paths[i]]
	end
end

return current
end