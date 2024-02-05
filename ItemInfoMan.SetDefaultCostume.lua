return function (self,costume,gender,bodyParts) 
local dc = self.DefaultCostume[gender]
if (bodyParts == _BodyParts.Clothes) then
	costume:SetEquip(MapleAvatarItemCategory.Coat, dc[1])
elseif (bodyParts == _BodyParts.Pants) then
	costume:SetEquip(MapleAvatarItemCategory.Pants, dc[2])
elseif (bodyParts == _BodyParts.Hair) then
	costume:SetEquip(MapleAvatarItemCategory.Hair, dc[3])
elseif (bodyParts == _BodyParts.Face) then
	costume:SetEquip(MapleAvatarItemCategory.Face, dc[4])
end
end