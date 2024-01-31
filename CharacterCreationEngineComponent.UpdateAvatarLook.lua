return function (self) 
local costume = self.Avatar.CostumeManagerComponent
costume.UseCustomEquipOnly = true
costume.CustomBodyEquip = _BodySkin.Table[0]
costume.CustomFaceEquip = _ItemInfoMan:GetAvatarRUID(self.Face)
costume.CustomHairEquip = _ItemInfoMan:GetAvatarRUID(self.Hair)
costume.CustomCoatEquip = _ItemInfoMan:GetAvatarRUID(self.Top)
costume.CustomPantsEquip = _ItemInfoMan:GetAvatarRUID(self.Pants)
costume.CustomShoesEquip = _ItemInfoMan:GetAvatarRUID(self.Shoes)
costume.CustomOneHandedWeaponEquip = _ItemInfoMan:GetAvatarRUID(self.Weapon)

---@type table<Entity>
local textTable = self.TextTable
textTable[0].TextComponent.Text = _StringMan:GetItemName(self.Face)
textTable[1].TextComponent.Text = _StringMan:GetItemName(self.Hair)
textTable[2].TextComponent.Text = _StringMan:GetItemName(self.Top)
textTable[3].TextComponent.Text = _StringMan:GetItemName(self.Pants)
textTable[4].TextComponent.Text = _StringMan:GetItemName(self.Shoes)
textTable[5].TextComponent.Text = _StringMan:GetItemName(self.Weapon)
if (self.Gender == 0) then
	textTable[6].TextComponent.Text = "남자"
else
	textTable[6].TextComponent.Text = "여자"
end
end