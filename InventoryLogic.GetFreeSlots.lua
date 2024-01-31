return function (self,cd,TI) 
local total = 0
local itemSlot = cd.ItemSlot[TI]
local max = cd.ItemMaxSlot[TI]
for i=1,max do
	if (itemSlot[i] == nil) then
		total += 1
	end
end
return total
end