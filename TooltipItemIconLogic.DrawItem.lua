return function (self,itemId,iconFlag,icon,cashIcon,iconRaw,scale,assetType) 
local ruid, info, size
if (itemId > 0) then
	if (_Items:IsEquip(itemId)) then
		info = _ItemInfoMan:GetEquip(itemId)
	else
		info = _ItemInfoMan:GetItem(itemId)
	end
	
	if (_Items:IsPet(itemId) and (iconFlag & _ItemIconFlag.PetDead) ~= 0) then
		if (iconRaw) then
			ruid = info.iconRawD
			size = Vector2(32, 32) --size = info.iconRawSize
		else
			ruid = info.iconD
			size = info.iconDSize
		end
	else
		if (iconRaw) then
			ruid = info.iconRaw
			size = Vector2(32, 32) --size = info.iconRawSize
		else
			ruid = info.icon
			size = info.iconSize
		end
	end
else
	ruid = nil
end

if not (_UtilLogic:IsNilorEmptyString(ruid)) then
	icon.Color.a = 1
	_TooltipLogic:SetItemTypeIcon(cashIcon.SpriteGUIRendererComponent, itemId, scale, assetType)
	_TooltipLogic:SetIcon(icon.Entity, ruid, size, scale, Vector2.zero)
else
	icon.ImageRUID = ""
	icon.Color.a = 0
	cashIcon.SpriteGUIRendererComponent.Color.a = 0
end
end