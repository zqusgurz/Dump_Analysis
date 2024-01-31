return function (self) 
local activeStats = self.ActiveIcons
for i=1,#self.ActiveIcons do
	---@type TemporaryStatIconComponent
	local icon = activeStats[i]
	_EntityUtils:SetPositionUIEntitySafelyEx(icon.Entity, (i-1) * -(32 + self.Spacing), 0)
end
end