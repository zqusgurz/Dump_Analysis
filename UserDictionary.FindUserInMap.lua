return function (self,targetId) 
local mapName = _UserService.LocalPlayer.CurrentMapName
if (_FieldAttributeLogic:IsHiddenUI(nil)) then
	return nil
end
local entitiesInMap = _UserService:GetUsersByMapName(mapName)
for i=1,#entitiesInMap do
	local target = entitiesInMap[i]
	if (target.WsUser.CharacterId == targetId) then
		return target
	end
end
return nil
end