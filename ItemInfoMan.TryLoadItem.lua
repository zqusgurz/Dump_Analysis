return function (self,itemId) 
if (_Items:IsEquip(itemId)) then
	do
		local ds = _DataService:GetTable("EquipData")
		local row = ds:FindRow("ItemId", tostring(itemId))
		if (row) then
			local ret = self:LoadItemRow(itemId, row, false)
			-- log(string.format("Loaded equip %d", itemId))
			return ret
		end
	end
	do
		local ds = _DataService:GetTable("CustomEquipData")
		local row = ds:FindRow("ItemId", tostring(itemId))
		if (row) then
			local ret = self:LoadItemRow(itemId, row, true)
			-- log(string.format("Loaded custom equip %d", itemId))
			return ret
		end
	end
else
	do
		local ds = _DataService:GetTable("ItemData")
		local row = ds:FindRow("ItemId", tostring(itemId))
		if (row) then
			local ret = self:LoadItemRow(itemId, row, false)
			-- log(string.format("Loaded item %d", itemId))
			return ret
		end
	end
	do
		local ds = _DataService:GetTable("CustomItemData")
		local row = ds:FindRow("ItemId", tostring(itemId))
		if (row) then
			local ret = self:LoadItemRow(itemId, row, true)
			-- log(string.format("Loaded custom item %d", itemId))
			return ret
		end
	end
end
self.NotExistsItem[itemId] = true
return nil
end