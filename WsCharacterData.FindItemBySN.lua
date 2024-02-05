return function (self,TI,sn) 
local items = self.ItemSlot[TI]
local slots = self.ItemMaxSlot[TI]
for i=1,slots do
	---@type ItemSlotBase
	local item = items[i]
	if (not item) then
		continue
	end
	if (item.ItemSN == sn) then
		return item
	end
end
return nil
end