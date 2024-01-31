return function (self,user) 
-- 중복 체크
---@type table<Entity>
local others = self.OtherIconEntities
for i=1,#others do
	if (others[i].MinimapIconComponent.WorldEntity == user) then
		return
	end
end
local icon = self:CreateIcon(_MinimapIconType.Other, user, "User-" .. user.OwnerId)
table.insert(self.OtherIconEntities, icon)
end