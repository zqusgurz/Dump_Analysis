return function (self) 
local activeStats = self.ActiveIcons
for i=#activeStats,1,-1 do
	---@type TemporaryStatIconComponent
	local icon = activeStats[i]
	self:RemoveIcon(icon)
end
self.ActiveIcons = {}
self.StatToId = {}
end