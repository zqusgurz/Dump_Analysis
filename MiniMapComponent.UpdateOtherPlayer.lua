return function (self,characterId) 
---@type table<Entity>
local icons = self.OtherIconEntities
for i=#icons,1,-1 do
	local icon = icons[i]
	local worldEntity = icon.MinimapIconComponent.WorldEntity
	if (isvalid(worldEntity)) then
		if (worldEntity.WsUser.CharacterId == characterId) then
			icon.MinimapIconComponent:UpdateIcon()
		end
	else
		icon:Destroy()
		table.remove(icons, i)
	end
end
end