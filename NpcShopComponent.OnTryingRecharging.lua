return function (self) 
local selectedSell = self.SelectedSellShopItem
if (selectedSell == nil) then
	return
end
local entry = selectedSell.NpcShopItemEntryComponent

local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
local realItem = cd:GetItem(entry.LinkedSellTI, entry.LinkedSellPos)
local itemId = entry.LinkedSellItemId
if (realItem == nil or realItem.ItemId ~= itemId) then
	_UtilDlgLogic:Show("알 수 없는 오류가 발생하여 상점 작업을 수행할 수 없습니다.")
	self:CloseShop()
	return
end
if (user.WsUser.ExclusiveAction) then
	return
end
if (_Items:IsRechargable(itemId)) then
	local slotMax = cd:GetSlotMax(itemId)
	if (realItem.Number >= slotMax) then
		return
	end
	local rechargeUnitPrice = self:GetRechargeUnitPrice(itemId)
	if (not rechargeUnitPrice) then
		_UtilDlgLogic:Show("메소가 부족합니다.")
		return
	end
	local price = math.ceil(rechargeUnitPrice * (slotMax - realItem.Number))
	_UtilDlgLogic:YesNo("정말로 충전 하시겠습니까?", function()
		user.WsUser.ExclusiveAction = true
		_NpcShopLogic:OnRechargeItem(user, entry.LinkedSellPos, itemId)
	end, nil)
end
end