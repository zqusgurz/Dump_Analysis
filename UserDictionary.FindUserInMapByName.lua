return function (self,name) 
local mapName = _UserService.LocalPlayer.CurrentMapName
if (_FieldAttributeLogic:IsHiddenUI(nil)) then
	return nil
end
local lName = name:lower()
local entitiesInMap = _UserService:GetUsersByMapName(mapName)
for i=1,#entitiesInMap do
	local target = entitiesInMap[i]
	if (target.WsUser.CharacterName:lower() == lName) then
		return target
	end
end
return nil
end