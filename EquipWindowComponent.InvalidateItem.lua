return function (self,pos) 
local u = _UserService.LocalPlayer
local cd = u.WsCharacterData

local eq2 = cd.Equipping2[pos]
local eq = cd.Equipping[pos]

---@type ItemElementComponent
local p = self.PosToElement[pos]
if (eq2 ~= nil) then
	p.Icon.Color.a = 1
	p:SetItemRaw(eq2)
elseif (eq ~= nil) then
	p.Icon.Color.a = 1
	p:SetItemRaw(eq)
else
	p.Icon.Color.a = 0
	p:SetItem(0)
end

-----@type ItemElementComponent
--local slot = self.PosToElement[pos]
--log ("Slot:", slot)
--if not (isvalid(slot)) then
--    log_error("Not available slot", slot)
--    return
--end
--local cd = _UserService.LocalPlayer.WsCharacterData
--local item = _InventoryLogic:RawGetItem(cd, 1, -(pos + 100)) -- 캐시 아이템
--log("Pos:", -(pos + 100), "Item:", item)
--if (item == nil) then
--    item = _InventoryLogic:RawGetItem(cd, 1, -pos) -- 일반 아이템
--    log("Pos:", -pos, "Item:", -pos)
--end
--log("isvalid?", isvalid(slot))
--if (item == nil) then
--    slot:SetItem(0)
--    slot:SetItemNo(-1)
--    return
--end
--if (_Items:IsEquip(item.ItemId)) then
--    slot:SetItem(item.ItemId)
--    slot:SetItemNo(-1)
--end
end