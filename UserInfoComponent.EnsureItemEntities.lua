return function (self,needCount) 
local entries = self.ItemEntries
local entriesNum = #entries
local itemLines = self.ItemLines
if (needCount > entriesNum) then
	for i=entriesNum+1,needCount do
		if (i ~= 1) then
			local line = _SpawnService:SpawnByModelId("model://4d689e30-752c-4f1e-951c-cdfd8dcb248d", "Line", Vector3.zero, self.ItemListView)
			line.Enable = false
			line.Visible = false
			itemLines[i - 1] = line
		end
		local item = _SpawnService:SpawnByModelId("model://a7cfb46d-fdd6-4ed0-9291-4a1954994fc4", "Item", Vector3.zero, self.ItemListView)
		item.Enable = false
		item.Visible = false
		entries[i] = item
	end
end
end