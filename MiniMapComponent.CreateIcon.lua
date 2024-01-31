return function (self,type,worldEntity,name) 
local parent
if (type == _MinimapIconType.User) then
	parent = self.LocalPlayerRoot
elseif (type == _MinimapIconType.Other) then
	parent = self.OtherPlayerRoot
else
	parent = self.EtcRoot
end
local icon = _SpawnService:SpawnByModelId("model://c8c51595-9f25-40cb-8e53-b20bd8763c32", 
	name,
	Vector3.zero,
	parent)
icon.MinimapIconComponent.WorldEntity = worldEntity
icon.MinimapIconComponent.MiniMap = self
icon.MinimapIconComponent.IconType = type
icon.MinimapIconComponent:UpdateIcon()
return icon
end