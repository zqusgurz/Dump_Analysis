return function (self,cd,TI,pos) 
if (TI < 1 or TI > 5) then
	return nil
end
if (pos == 0 or pos > 96) then
	return nil
end
if (TI == 1 and pos < 0) then
	pos = -pos
	if (pos > 100) then
		pos -= 100
		local item = cd.Equipping2[pos]
		--log(string.format("Return Equipping2 %d: ", pos), item)
		return item
	else
		local item = cd.Equipping[pos]
		--log(string.format("Return Equipping %d: ", pos), item)
		return item
	end
end
local item = cd.ItemSlot[TI][pos]
--log(string.format("Return ItemSlot TI:%d, %d: ", TI, pos), item)
return item
end