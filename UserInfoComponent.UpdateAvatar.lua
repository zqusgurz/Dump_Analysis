return function (self,targetUser) 
if (not isvalid(targetUser)) then
	log("Not available target user")
	return
end
local cd = targetUser.WsCharacterData

local function isEquippingAvatarLookRing(itemId)
	if (cd.AvatarLook[100 + _BodyParts.Ring1] == itemId) then
		return true
	end
	if (cd.AvatarLook[100 + _BodyParts.Ring2] == itemId) then
		return true
	end
	if (cd.AvatarLook[100 + _BodyParts.Ring3] == itemId) then
		return true
	end
	if (cd.AvatarLook[100 + _BodyParts.Ring4] == itemId) then
		return true
	end
	return false
end

local blockedMSWAvatar = targetUser.WsUserAvatarLook:IsBlockedMSWAvatarToMe()
local equippingCodiAvatar = isEquippingAvatarLookRing(1112993)
local btOnOffEntity = self.BtAvatarOnOff.Entity
local btOnOff = self.BtAvatarOnOff
if (self.IsSelf) then
	btOnOffEntity.Enable = false
else
	btOnOffEntity.Enable = true
	if (equippingCodiAvatar or blockedMSWAvatar) then
		btOnOff:SetInteractible(true)
		if (blockedMSWAvatar) then
			-- 파란 자물쇠
			btOnOffEntity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/MonsterCarnival/icon2")
			btOnOff:UpdateTooltipText("메이플스토리 월드 아바타가 가려진 상태입니다.")
		else
			-- 회색 자물쇠
			btOnOffEntity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/MonsterCarnival/icon3")
			btOnOff:UpdateTooltipText("메이플스토리 월드 아바타를 볼 수 있는 상태입니다.")
		end
	else
		-- 회색 자물쇠
		btOnOffEntity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/MonsterCarnival/icon3")
		btOnOff:SetInteractible(false)
		btOnOff:UpdateTooltipText(string.format("%s를 착용하고 있지 않은 플레이어 입니다.", _StringMan:GetItemName(1112993)))
	end
end

local mswAvatar = targetUser.WsUserAvatarLook.MSWAvatarForPart
_PlayerCostumeLogic:UpdateCustomCostume(targetUser.OwnerId, blockedMSWAvatar, self.Avatar, cd.Gender, cd.Face, cd.Hair, cd.Skin, cd.AvatarLook, mswAvatar)
end