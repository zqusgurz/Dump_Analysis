return function (self) 
if (not isvalid(self.MiniMapCanvas)) then
	return
end
self.UserIconUpdateTimer = _TimerService:SetTimerRepeat(function()
	local iconEntity = self.UserIconEntity
	if (isvalid(iconEntity)) then
		if (iconEntity.MinimapIconComponent:UpdateIconPosition(false, _MinimapIconType.User)) then
			self:UpdateMiniMapScroll()
		end
	end
	---@type table<Entity>
	local others = self.OtherIconEntities
	for i=1,#others do
		local other = others[i].MinimapIconComponent
		other:UpdateIconPosition(not other.CompletedSizing, _MinimapIconType.Other)
	end
end, 0.1, 0.1)
end