return function (self,item) 
local cd = _UserService.LocalPlayer.WsCharacterData
local compItem = self.Item
local compEquip = self.Equip
local compEquipping = self.Equipping
local width = 0
local height = 0
local max = math.max

if (_Items:IsEquip(item.ItemId)) then
	compItem.Entity.Enable = false
	compEquip.Entity.Enable = true
	
	---@type ItemSlotEquip
	local eqp = item
	local size = compEquip:SetItemTooptip(cd, eqp)
	if (size == nil) then
		return
	end
	width = size.x
	height = max(height, size.y)
	
	local bodyParts = _Items:GetBodyPartsFromItem(item.ItemId, cd.Gender)
	if (#bodyParts > 0) then
		---@type ItemSlotEquip
		local equipping = cd:GetItem(1, -bodyParts[1])
		if (equipping ~= nil) then
			compEquipping.Entity.Enable = true
			local bSize = compEquipping:SetItemTooptip(cd, equipping)
			if (bSize == nil) then
				return
			end
			width = size.x + 4 + bSize.x
			height = max(height, bSize.y)
			_EntityUtils:SetPositionUIEntitySafelyEx(compEquipping.Entity, size.x + 4, nil)
		else
			compEquipping.Entity.Enable = false
		end
	else
		compEquipping.Entity.Enable = false
	end
else
	compEquip.Entity.Enable = false
	compEquipping.Entity.Enable = false
	compItem.Entity.Enable = true
	width = 286
	height = max(height, compItem:SetItemTooptip(cd, item))
end

_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, width, height)
_UpdateComponentLogic:InsertUpdateVisible(self.Entity)
end