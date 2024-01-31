return function (self,npcId) 
---@type table<Entity>
local icons = self.NpcIconEntities
for i=#icons,1,-1 do
	local icon = icons[i]
	local worldEntity = icon.MinimapIconComponent.WorldEntity
	if (isvalid(worldEntity)) then
		if (worldEntity.NpcComponent.NpcTemplateID == npcId) then
			icon.MinimapIconComponent:UpdateIcon()
		end
	else
		icon:Destroy()
		table.remove(icons, i)
	end
end
end