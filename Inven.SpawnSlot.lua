return function (self,idx,category) 
if idx then
	if category == "변신포션" then
		local dataT = _DataService:GetTable("Potion")
			for i = 1, dataT:GetRowCount() do
			local dataTable = dataT:GetRow(i)
			local name = dataTable:GetItem("name")
			local info = dataTable:GetItem("info")
			local icon = dataTable:GetItem("icon")
			local item = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI/MainPanel/Slot_0"), name, Vector3.zero)
			table.insert(self.itemSlot, item)
			item.IvenItem.category = category
			item.IvenItem.info = info
			item:GetChildByName("Icon").SpriteGUIRendererComponent.ImageRUID =  icon
			item.IvenItem.icon = icon
			item.IvenItem.idx = i
		end
	elseif category == "의자" then
		local dataT = _DataService:GetTable("Chair")
		for i = 1, dataT:GetRowCount() do
			local dataTable = dataT:GetRow(i)
			local name = dataTable:GetItem("name")
			local info = dataTable:GetItem("info")
			local icon = dataTable:GetItem("icon")
			local item = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI/MainPanel/Slot_0"), name, Vector3.zero)
			table.insert(self.itemSlot, item)
			item.IvenItem.category = category
			item.IvenItem.info = info
			item:GetChildByName("Icon").SpriteGUIRendererComponent.ImageRUID =  icon
			item.IvenItem.icon = icon
			item.IvenItem.idx = i
		end
	elseif category == "소비" then
		local dataT = _DataService:GetTable("Use")
		for i = 1, dataT:GetRowCount() do
			local dataTable = dataT:GetRow(i)
			local name = dataTable:GetItem("name")
			local info = dataTable:GetItem("info")
			local icon = dataTable:GetItem("icon")
			local item = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI/MainPanel/Slot_0"), name, Vector3.zero)
			table.insert(self.itemSlot, item)
			item.IvenItem.category = category
			item.IvenItem.info = info
			item:GetChildByName("Icon").SpriteGUIRendererComponent.ImageRUID =  icon
			item.IvenItem.icon = icon
			item.IvenItem.idx = i
		end
	end
else
	local item = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI/MainPanel/Slot_0"), "null", Vector3.zero)
	item.IvenItem.category = category
	table.insert(self.itemSlot, item)
end
end