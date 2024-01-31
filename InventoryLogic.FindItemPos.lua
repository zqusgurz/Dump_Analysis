return function (self,cd,itemId) 
local TI = itemId // 1000000
local itemSlot = cd.ItemSlot[TI]
for i=1,cd.ItemMaxSlot[TI] do
	---@type ItemSlotBase
	local item = cd.ItemSlot[TI][i]
	if (item ~= nil and item.ItemId == itemId) then
		return i
	end
end
return -1
end