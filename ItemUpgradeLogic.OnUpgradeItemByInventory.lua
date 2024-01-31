return function (self,srcPos,dstPos,spirit) 
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
if (not user.WsUser:IsAvailableInventoryOperation()) then
	_Log:Warning("try to upgrade item on unavailable inventory operation")
	return
end
if (not spirit and dstPos > 0) then
	_Log:Warning("try to upgrade item on inventory while not spirit")
	return
end
local rawItem = _InventoryLogic:RawGetItem(cd, 2, srcPos)
if (rawItem == nil) then
	return
end
if (not _Items:IsUpgradeScroll(rawItem.ItemId)) then
	log("not upgrade scroll", rawItem.ItemId)
	return
end
---@type ItemSlotEquip
local equippingItem = _InventoryLogic:RawGetItem(cd, 1, dstPos)
if (equippingItem == nil) then
	return
end
if (not _Items:IsProperUpgradeScroll(rawItem.ItemId, equippingItem)) then
	log("failed to check req", rawItem.ItemId, equippingItem.ItemId)
	return
end
user.WsUser.ExclusiveAction = true
self:OnUpgradeItem(user, dstPos, srcPos, spirit)
end