return function (self,scrollId,equipItem) 
local targetItemId = equipItem.ItemId
if (targetItemId // 1000000 ~= 1) then
	log("not equip")
	return false
end
if (scrollId // 10000 ~= 204) then
	log("not scroll")
	return false
end
local scrollPart = (scrollId % 10000) // 100
local targetPart = (targetItemId // 10000) % 100
if (scrollPart ~= targetPart) then
	log("no target part")
	return false
end
if (scrollPart == 2041200) then
	if (targetItemId ~= 1122000) then
		log("no 혼테일의 목걸이")
		return false
	end
elseif (scrollPart == 2041201) then
	if (targetItemId ~= 1122007) then
		log("no 슈피겔만 목걸이")
		return false
	end
end
if (equipItem.RUC == 0) then
	log("no RUC")
	return false
end
return true
end