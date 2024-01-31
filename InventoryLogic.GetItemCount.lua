return function (self,cd,itemId) 
local total = 0
local TI = itemId // 1000000
for i=1,cd.ItemMaxSlot[TI] do
	---@type ItemSlotBase
	local item = cd.ItemSlot[TI][i]
	if (item ~= nil and item.ItemId == itemId) then
		if (_Items:IsTreatSingly(itemId)) then
			total += 1
		else
			total += item.Number
		end
	end
end
return total
end