return function (self,itemId) 
local equip = self:GetEquip(itemId)
if (equip == nil) then
	return ""
end
return equip.AvatarRUID
end