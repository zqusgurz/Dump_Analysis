return function (self,user) 
---@type table<Entity>
local icons = self.OtherIconEntities
for i=1,#icons do
	local icon = icons[i]
	if (icon.MinimapIconComponent.WorldEntity == user) then
		icon:Destroy()
		table.remove(icons, i)
		return
	end
end
end