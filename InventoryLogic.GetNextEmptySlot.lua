return function (self,cd,TI,except) 
for Slot = 1, cd.ItemMaxSlot[TI], 1 do
	if (Slot ~= except and cd.ItemSlot[TI][Slot] == nil) then
		return Slot
	end
end

return -1
end