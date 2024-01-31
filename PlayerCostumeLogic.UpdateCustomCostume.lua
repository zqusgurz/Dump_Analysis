return function (self,userId,blockedMSWAvatar,costume,gender,face,hair,skin,avatarLook,mswAvatar) 
costume.DefaultEquipUserId = userId

local pcl = _PlayerCostumeLogic
local getItem = _PlayerCostumeLogic.GetItemIdFromBodyParts

local function isEquippingAt(itemId, bodyPart)
	if (getItem(pcl, avatarLook, bodyPart) == itemId) then
		return true
	end
	return false
end
local function isEquippingRing(itemId)
	if (getItem(pcl, avatarLook, _BodyParts.Ring1) == itemId) then
		return true
	elseif (getItem(pcl, avatarLook, _BodyParts.Ring2) == itemId) then
		return true
	elseif (getItem(pcl, avatarLook, _BodyParts.Ring3) == itemId) then
		return true
	elseif (getItem(pcl, avatarLook, _BodyParts.Ring4) == itemId) then
		return true
	end
	return false
end

-- 코디 반지
if (not blockedMSWAvatar and isEquippingRing(1112993)) then
	costume.UseCustomEquipOnly = false
	for i=1,19 do
		pcall(function() costume:SetEquip(MapleAvatarItemCategory.CastFrom(i), "") end)
	end
	return
end
costume.UseCustomEquipOnly = true

_ItemInfoMan:SetDefaultCostume(costume, gender, _BodyParts.Hair)
_ItemInfoMan:SetDefaultCostume(costume, gender, _BodyParts.Face)
_ItemInfoMan:SetDefaultCostume(costume, gender, _BodyParts.Clothes)
_ItemInfoMan:SetDefaultCostume(costume, gender, _BodyParts.Pants)

local function getItemIdFromBodyParts(part, mswTransparent, mswTransparent2)
	local eqp2 = avatarLook[100 + part]
	if (eqp2 ~= nil and eqp2 ~= mswTransparent and eqp2 ~= mswTransparent2) then
		return eqp2
	end
	local eqp = avatarLook[part]
	if (eqp ~= nil) then
		return eqp
	end
	return 0
end

local avatar = getItemIdFromBodyParts(_BodyParts.Cap, 1002990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Cap, ruid) end)
else
	pcall(function() costume:SetEquip(MapleAvatarItemCategory.Cap, "") end)
end

avatar = getItemIdFromBodyParts(_BodyParts.Cape, 1102990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Cape, ruid) end)
else
	pcall(function() costume:SetEquip(MapleAvatarItemCategory.Cape, "") end)
end
local coat = getItemIdFromBodyParts(_BodyParts.Clothes, 1052990, 1042990)
if (coat ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(coat)
	if (_Items:IsLongcoat(coat)) then
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Longcoat, ruid) end)
		pcall(function() costume:SetEquip(MapleAvatarItemCategory.Coat, "") end)
	else
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Longcoat, "") end)
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Coat, ruid) end)
	end
else
	pcall(function() costume:SetEquip(MapleAvatarItemCategory.Longcoat, "") end)
end
avatar = getItemIdFromBodyParts(_BodyParts.Pants, 1062990, nil)
if (avatar ~= 0) then
	if not (_Items:IsLongcoat(coat)) then
	    ruid = _ItemInfoMan:GetAvatarRUID(avatar)
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Pants, ruid) end)
	else
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Pants, "") end)
	end
end
avatar = getItemIdFromBodyParts(_BodyParts.EarAcc, 1032990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.EarAccessory, ruid) end)
else
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.EarAccessory, "") end)
end
avatar = getItemIdFromBodyParts(_BodyParts.EyeAcc, 1022990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.EyeAccessory, ruid) end)
else
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.EyeAccessory, "") end)
end
avatar = getItemIdFromBodyParts(_BodyParts.FaceAcc, 1012990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.FaceAccessory, ruid) end)
else
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.FaceAccessory, "") end)
end
avatar = getItemIdFromBodyParts(_BodyParts.Gloves, 1082990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Glove, ruid) end)
else
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Glove, "") end)
end
avatar = getItemIdFromBodyParts(_BodyParts.Ring1, nil, nil)
if (avatar ~= 0) then
	-- Ring1
end
avatar = getItemIdFromBodyParts(_BodyParts.Ring2, nil, nil)
if (avatar ~= 0) then
	-- Ring2
end
avatar = getItemIdFromBodyParts(_BodyParts.Ring3, nil, nil)
if (avatar ~= 0) then
	-- Ring3
end
avatar = getItemIdFromBodyParts(_BodyParts.Ring4, nil, nil)
if (avatar ~= 0) then
	-- Ring4
end
avatar = getItemIdFromBodyParts(_BodyParts.Shield, nil, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.SubWeapon, ruid) end)
else
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.SubWeapon, "") end)
end
avatar = getItemIdFromBodyParts(_BodyParts.Shoes, 1072990, nil)
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Shoes, ruid) end)
else
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Shoes, "") end)
end

avatar = avatarLook[100 + _BodyParts.Weapon]
if (avatar ~= nil) then
	local realWeapon = avatarLook[_BodyParts.Weapon]
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
	if (_Items:IsOneHandedWeapon(realWeapon)) then
    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.OneHandedWeapon, ruid) end)
    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.TwoHandedWeapon, "") end)
	else
    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.OneHandedWeapon, "") end)
    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.TwoHandedWeapon, ruid) end)
	end
else
	avatar = avatarLook[_BodyParts.Weapon] 
	if (avatar ~= nil) then
	    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
		if (_Items:IsOneHandedWeapon(avatar)) then
	    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.OneHandedWeapon, ruid) end)
	    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.TwoHandedWeapon, "") end)
		else
	    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.OneHandedWeapon, "") end)
	    	pcall(function() costume:SetEquip(MapleAvatarItemCategory.TwoHandedWeapon, ruid) end)
			-- log("Normal two handed weapon:", avatar, " / ", ruid)
		end
	else
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.OneHandedWeapon, "") end)
	    pcall(function() costume:SetEquip(MapleAvatarItemCategory.TwoHandedWeapon, "") end)
	end
end
--self:UpdateWeaponAfterImageSfx()

avatar = hair
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Hair, ruid) end)
end
avatar = face
if (avatar ~= 0) then
    local ruid = _ItemInfoMan:GetAvatarRUID(avatar)
    pcall(function() costume:SetEquip(MapleAvatarItemCategory.Face, ruid) end)
end
avatar = skin
if (_Items:IsSkin(avatar)) then
	local ruid = _BodySkin.Table[avatar]
	pcall(function() costume:SetEquip(MapleAvatarItemCategory.Body, ruid) end)
end

---@param ringId integer
---@param category MapleAvatarItemCategory
---@param shouldCheck boolean
local function applyForRing(ringId, category, shouldCheck)
	if (isEquippingRing(ringId)) then
		local avatarId = mswAvatar[category]
		if (shouldCheck) then
			if (_UtilLogic:IsNilorEmptyString(avatarId)) then
				return
			end
		end
		pcall(function() costume:SetEquip(category, avatarId) end)
	end
end
---@param itemId integer
---@param bodyPart integer
---@param category MapleAvatarItemCategory
---@param shouldCheck boolean
---@return boolean
local function applyIfEquipped(itemId, bodyPart, category, shouldCheck)
	if (isEquippingAt(itemId, bodyPart)) then
		local avatarId = mswAvatar[category]
		if (shouldCheck) then
			if (_UtilLogic:IsNilorEmptyString(avatarId)) then
				return false
			end
		end
		pcall(function() costume:SetEquip(category, avatarId) end)
		return true
	end
	return false
end

applyIfEquipped(1002990, _BodyParts.Cap, MapleAvatarItemCategory.Cap, false)
applyIfEquipped(1012990, _BodyParts.FaceAcc, MapleAvatarItemCategory.FaceAccessory, false)
applyIfEquipped(1022990, _BodyParts.EyeAcc, MapleAvatarItemCategory.EyeAccessory, false)
applyIfEquipped(1032990, _BodyParts.EarAcc, MapleAvatarItemCategory.EarAccessory, false)
if (not applyIfEquipped(1052990, _BodyParts.Clothes, MapleAvatarItemCategory.Longcoat, false)) then
	applyIfEquipped(1042990, _BodyParts.Clothes, MapleAvatarItemCategory.Coat, true)
	applyIfEquipped(1062990, _BodyParts.Pants, MapleAvatarItemCategory.Pants, true)
end
applyIfEquipped(1072990, _BodyParts.Shoes, MapleAvatarItemCategory.Shoes, false)
applyIfEquipped(1082990, _BodyParts.Gloves, MapleAvatarItemCategory.Glove, false)
applyIfEquipped(1102990, _BodyParts.Cape, MapleAvatarItemCategory.Cape, false)
applyForRing(1112990, MapleAvatarItemCategory.Hair, true)
applyForRing(1112991, MapleAvatarItemCategory.Face, true)
applyForRing(1112992, MapleAvatarItemCategory.Body, true)

end