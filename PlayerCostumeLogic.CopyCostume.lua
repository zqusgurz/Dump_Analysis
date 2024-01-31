return function (self,from,to) 
--to.CustomCapEquip = from.CustomCapEquip
--to.CustomEarEquip = from.CustomEarEquip
--to.CustomBodyEquip = from.CustomBodyEquip
--to.CustomCapeEquip = from.CustomCapeEquip
--to.CustomCoatEquip = from.CustomCoatEquip
--to.CustomFaceEquip = from.CustomFaceEquip
--to.CustomHairEquip = from.CustomHairEquip
--to.CustomGloveEquip = from.CustomGloveEquip
--to.CustomPantsEquip = from.CustomPantsEquip
--to.CustomShoesEquip = from.CustomShoesEquip
--to.CustomLongcoatEquip = from.CustomLongcoatEquip
--to.CustomSubWeaponEquip = from.CustomSubWeaponEquip
--to.CustomEarAccessoryEquip = from.CustomEarAccessoryEquip
--to.CustomEyeAccessoryEquip = from.CustomEyeAccessoryEquip
--to.CustomFaceAccessoryEquip = from.CustomFaceAccessoryEquip
--to.CustomOneHandedWeaponEquip = from.CustomOneHandedWeaponEquip
--to.CustomTwoHandedWeaponEquip = from.CustomTwoHandedWeaponEquip
for i=1,19 do
	local t = MapleAvatarItemCategory.CastFrom(i)
	to:SetEquip(t, from:GetEquip(t))
end
to.UseCustomEquipOnly = from.UseCustomEquipOnly
end