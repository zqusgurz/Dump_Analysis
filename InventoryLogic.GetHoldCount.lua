return function (self,cd,TI) 
local total = 0
local itemSlot = cd.ItemSlot[TI]
local max = cd.ItemMaxSlot[TI]
for i=1,max do
	---@type ItemSlotBase
	local item = itemSlot[i]
	if (item ~= nil) then
		total += 1
	end
end
return total
end