return function (self) 
local activeStats = self.ActiveIcons
for i=1,#self.ActiveIcons do
	---@type TemporaryStatIconComponent
	local icon = activeStats[i]
	icon:Update()
end
end