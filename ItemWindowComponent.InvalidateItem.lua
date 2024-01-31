return function (self,TI,pos) 
if (TI ~= self.CurrentTab) then
	log_error("Invalid TI", TI)
	return
end
--log("[1]", TI, pos)
---@type Entity
local slot = self.Slots[TI][pos]
--log("[2]", slot)
if not (isvalid(slot)) then
	log_error("Not available slot", slot)
	return
end
local cd = _UserService.LocalPlayer.WsCharacterData
local item = _InventoryLogic:RawGetItem(cd, TI, pos)
local element = slot.ItemElementComponent
--log("[3]", item)
if (item == nil) then
	element:SetItem(0)
	element:SetItemNo(-1)
	element.ActiveIcon.Enable = false
	return
end
--log("[4]", item.ItemId)
element:SetItemRaw(item)
element:SetItemNo(_Items:IsEquip(item.ItemId) and -1 or item.Number)

if (TI == 2 and pos == _BulletConsumeLogic.ActiveBulletPos) then
	-- log(string.format("Pos:%d (ActiveBulletPos:%d)  ActiveIcon True", pos, _BulletConsumeLogic.ActiveBulletPos))
	element.ActiveIcon.Enable = true
	element.ActiveIcon.SpriteGUIRendererComponent.Color.a = 1
else
	-- log(string.format("Pos:%d (ActiveBulletPos:%d)  ActiveIcon False", pos, _BulletConsumeLogic.ActiveBulletPos))
	element.ActiveIcon.Enable = false
end
end