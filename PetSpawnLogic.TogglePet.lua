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

local function togglePet()
	user.WsUser.ExclusiveAction = true
	self:RequestTogglePet(user, pos)
	-- log(string.format("Toggle pet: %d", item.ItemId))
end

if (_Items:HasItemAttr(item, _ItemAttribute.TradeOnce)) then
	_UtilDlgLogic:YesNo("아이템을 사용하면 다른 사용자와 교환하실 수 없습니다.\n\n그래도 사용하시겠습니까?", function()
		togglePet()
	end, nil)
else
	togglePet()
end
end