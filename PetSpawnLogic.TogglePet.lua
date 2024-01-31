return function (self,pos) 
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
local item = cd:GetItem(5, pos)
if (not item or not _Items:IsPet(item.ItemId)) then
	return
end
---@type ItemSlotPet
local pet = item
if (not pet.DeadTime or DateTime(pet.DeadTime) < DateTime.UtcNow) then
	_UtilDlgLogic:Show("마법의 시간이 다 되어 움직일 수 없습니다")
	return
end
if (_CharacterActionLogic:IsOnLadderOrRope(user.StateComponent.CurrentStateName)) then
	_UtilDlgLogic:Show("매달린 상태에서는 할 수 없습니다.")
	return
end
if (user.CharacterActionComponent:CheckAlert()) then
	return
end
-- log(string.format("Toggle pet: %d", item.ItemId))
user.WsUser.ExclusiveAction = true
self:RequestTogglePet(user, pos)
end