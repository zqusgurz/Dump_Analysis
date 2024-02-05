return function (self,itemId,pos,gender) 
local itemGender = self:GetGenderFromId(itemId)
if (gender == 2 or itemGender == 2 or gender == itemGender) then
	local list = self:GetBodyPartsFromItem(itemId, gender)
	return _TableUtils:Contains(list, pos)
end
return false
end