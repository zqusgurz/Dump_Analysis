return function (self,stat) 
local activeStats = self.ActiveIcons
local id = self.StatToId[stat]
if (id == nil) then
	log_warning("unknown stat id ", stat)
	return
end
local changed = false
for i=#activeStats,1,-1 do
	---@type TemporaryStatIconComponent
	local icon = activeStats[i]
	if (icon.Id == id) then
		self:RemoveIcon(icon)
		table.remove(activeStats, i)
		self.StatToId[stat] = nil
		changed = true
	end
end
if (changed) then
	self:AdjustPosition()
end
end