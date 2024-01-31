return function (self,needSizing,realIconType) 
local miniMap = self.MiniMap
if (not isvalid(miniMap)) then
	return
end
local miniMapInfo = miniMap.MiniMapInfo
if (not isvalid(miniMapInfo)) then
	return
end

local icon = self.Entity
local worldEntity = self.WorldEntity
local data = self:GetMiniMapIconData(realIconType)
local pos = Vector2.zero

if (isvalid(worldEntity)) then
	if (type == _MinimapIconType.Npc) then
		pos = worldEntity.NpcComponent.HomeGroundPosition
	else
		pos = worldEntity.TransformComponent.WorldPosition:ToVector2()
	end
end
if (self.IconType == _MinimapIconType.User) then
	if (self.LastPosition == pos) then
		return false
	end
end
self.LastPosition = pos:Clone()

local transformed = miniMapInfo:TransformPosition(pos)
local x, y = nil, nil
if (needSizing) then
	self.LastIconSize = data.SpriteSize:Clone()
	x = data.SpriteSize.x
	y = data.SpriteSize.y
	self.CompletedSizing = true
end

transformed.x += (-self.LastIconSize.x / 2)
transformed.y += self.LastIconSize.y

_EntityUtils:SetUIEntitySafelyEx(icon, transformed.x, transformed.y, x, y)
--icon.SpriteGUIRendererComponent.LocalPosition = Vector2(-sizeX / 2, sizeY) * 2
return true
end