return function (self) 
do
	local equips = _DataService:GetTable("EquipData")
	local rows = equips:GetAllRow()
	for i=1, #rows do
		local row = rows[i]
		local itemId = tonumber(row:GetItem("ItemId")) or 0
		if (itemId == 0) then
			continue
		end
		self:LoadItemRow(itemId, row, false)
	end
end
do
	local customEquips = _DataService:GetTable("CustomEquipData")
	local rows = customEquips:GetAllRow()
	for i=1, #rows do
		local row = rows[i]
		local itemId = tonumber(row:GetItem("ItemId")) or 0
		if (itemId == 0) then
			continue
		end
		self:LoadItemRow(itemId, row, true)
	end
end
do
	local items = _DataService:GetTable("ItemData")
	local rows = items:GetAllRow()
	for i=1, #rows do
		local row = rows[i]
		local itemId = tonumber(row:GetItem("ItemId")) or 0
		if (itemId == 0) then
			continue
		end
		self:LoadItemRow(itemId, row, false)
	end
end
do
	local customItems = _DataService:GetTable("CustomItemData")
	local rows = customItems:GetAllRow()
	for i=1, #rows do
		local row = rows[i]
		local itemId = tonumber(row:GetItem("ItemId")) or 0
		if (itemId == 0) then
			continue
		end
		self:LoadItemRow(itemId, row, true)
	end
end
end