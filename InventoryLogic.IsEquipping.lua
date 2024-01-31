return function (self,cd,itemId) 
for i=1,_BodyParts.Max do
	---@type ItemSlotEquip
	local item = cd.Equipping[i]
	---@type ItemSlotEquip
	local item2 = cd.Equipping2[i]
	if (item ~= nil and item.ItemId == itemId) then
		return true
	end
	if (item2 ~= nil and item2.ItemId == itemId) then
		return true
	end
end
return false
end