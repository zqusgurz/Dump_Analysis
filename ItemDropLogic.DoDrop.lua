return function (self,ditem) 
local player = _UserService.LocalPlayer
if (ditem.LinkedTI == 6) then
	if (not player.CharacterActionComponent:CheckAlert()) then
		player.WsUser:TrySetConsumeItem(0, ditem.LinkedPos)
	end
	return
end
if (_Items:IsNoDrop(ditem.ItemId) or _UserService.LocalPlayer.WsUser:IsDied()) then
	_UtilDlgLogic:Show("이 아이템은 버릴 수 없습니다.")
	return
end

if (not player.WsUser:IsAvailableInventoryOperation()) then
	return
end
if (player.CharacterActionComponent:CheckAlert()) then
	return
end

local cd = player.WsCharacterData
local item = cd:GetItem(ditem.LinkedTI, ditem.LinkedPos)
if (item == nil) then
	_UtilDlgLogic:Show("존재하지 않는 아이템은 버릴 수 없습니다.")
	return
end

if (_Items:IsQuestItem(ditem.ItemId)) then
	_UtilDlgLogic:YesNo("이 아이템은 버리고 나서 다시 회수할 수\n없고, 퀘스트도 정상적으로 할 수 없습니다.\n그래도 버리시겠습니까?", function()
		self:DropItem(item, ditem)
	end, nil)
elseif (_Items:IsTradeBlock(ditem.ItemId) or _Items:HasItemAttr(item, _ItemAttribute.NoTrade)) then
	_UtilDlgLogic:YesNo("이 아이템은 버린 후 다시 회수할 수 없습니다\n그래도 버리시겠습니까?", function()
		self:DropItem(item, ditem)
	end, nil)
else
	self:DropItem(item, ditem)
end
end