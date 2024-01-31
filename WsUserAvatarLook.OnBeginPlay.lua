return function (self) 
-- self.NeedUpdateAvatarLook = true
self._T.HitFlashingIndex = 0
self._T.LastAvatarColor = Color.white

local part = self.MSWAvatarForPart
local costume = self.Entity.CostumeManagerComponent
for i=1,19 do
	local category = MapleAvatarItemCategory.CastFrom(i)
	local equip = costume:GetEquip(category)
	if (equip == nil) then
		equip = ""
	end
	part[category] = equip
	-- log(category, part[category])
end
end