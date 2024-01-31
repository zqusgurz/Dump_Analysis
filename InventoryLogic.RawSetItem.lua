return function (self,cd,TI,pos,item) 
if (pos > cd.ItemMaxSlot[TI]) then
	log_warning(string.format("TI:%d Pos:%d is out of range", TI, pos))
	return
end
if (TI == 1 and pos < 0) then
	pos = -pos
	if (pos > 100) then
		pos -= 100
		cd.Equipping2[pos] = item
		--log(string.format("Equipping2 %d: ", pos), item)
	else
		cd.Equipping[pos] = item
		--log(string.format("Equipping %d: ", pos), item)
	end
	return
end
--log(string.format("ItemSlot TI:%d, %d: ", TI, pos), item)
cd.ItemSlot[TI][pos] = item
end