return function (self,type) 
local u = _UserService.LocalPlayer
local cd = u.WsCharacterData
local itemId = 0
if (type == _ConsumeItemElementType.HP) then
	itemId = u.WsUser.ConsumeHP
elseif (type == _ConsumeItemElementType.MP) then
	itemId = u.WsUser.ConsumeMP
end

---@type ItemElementComponent
local p = self.ConsumePosToKey[type]
if (itemId > 0) then
	p.Icon.Color.a = 1
	p:SetItem(itemId)
	p:SetItemNo(_InventoryLogic:GetItemCount(cd, itemId))
else
	p.Icon.Color.a = 0
	p:SetItem(0)
	p:SetItemNo(-1)
end
end