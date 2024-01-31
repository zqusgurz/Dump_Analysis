return function (self) 
local TI = self.LinkedItemTI
local pos = self.LinkedItemPos
local isEquipElement = TI == 1 and pos < 0
local isConsumeElement = TI == 6
if (not isEquipElement and not isConsumeElement) then
	return
end
local disabled = false
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData

if (isEquipElement) then
	local item = cd:GetItem(1, pos)
	
	if (item ~= nil) then
		local bs = user.WsBasicStat
		if (not _Items:IsAbleToEquip(item.ItemId, cd.Level, cd.Job, bs.Str, bs.Dex, bs.Int, bs.Luk, cd.Pop, -pos, cd.Gender)) then
			disabled = true goto END
		end
	end
	if (pos == -_BodyParts.Shield) then
		local weapon = cd:GetItem(1, -_BodyParts.Weapon)
		if (weapon ~= nil and _Items:IsTwoHandedWeapon(weapon.ItemId)) then
			disabled = true goto END
		end
	elseif (pos == -_BodyParts.Pants) then
		local coat = cd:GetItem(1, -_BodyParts.Clothes)
		if (coat ~= nil) then
			if (_Items:IsLongcoat(coat.ItemId)) then
				disabled = true goto END
			end
		end
		if (item == nil) then
			local cashCoat = cd:GetItem(1, -(_BodyParts.Clothes + 100))
			if (cashCoat ~= nil) then
				if (_Items:IsLongcoat(cashCoat.ItemId)) then
					disabled = true goto END
				end
			end
		end
	end
else
	if (pos == _ConsumeItemElementType.HP or pos == _ConsumeItemElementType.MP) then
		disabled = true
		local pet = user.PetOwnerComponent.Pet
		if (isvalid(pet)) then
			local pc = pet.PetComponent
			if (pos == _ConsumeItemElementType.HP) then
				if (_Items:HasPetSkillAttr2(pc, _PetSkillAttribute.ConsumeHP)) then
					disabled = false
				end
			elseif (pos == _ConsumeItemElementType.MP) then
				if (_Items:HasPetSkillAttr2(pc, _PetSkillAttribute.ConsumeMP)) then
					disabled = false
				end
			end
		end
	end
end

::END::
self:SetSlotDisabled(disabled)
end