return function (self,wzEffect,pattern,k,skillId) 
if (wzEffect == nil) then
	return
end
local bookId = skillId // 10000
local animPath = string.format(pattern, bookId, skillId, k)
local z = _WzUtils:GetInt32(wzEffect["z"], 0)
local asset = _UidMan:GetAnimation(animPath)
if (not _UtilLogic:IsNilorEmptyString(asset)) then
	local avatarRenderer = self.Entity.AvatarRendererComponent
	local orderInLayer
	if (z < 0) then
		orderInLayer = -1
	else
		orderInLayer = 5
	end
	_EffectService:PlayEffectAttached(asset, self.Entity, Vector3.zero, 0, Vector3.one, false, {
		["SortingLayer"] = avatarRenderer.SortingLayer,
		["OrderInLayer"] = z
	})
else
	local sprite = self:PickSkillEffect(z)
	local msp = sprite.MapleSpriteRendererComponent
	msp.DisappearWhenAnimationOnceEnd = true
	msp:SetFacingLeft(self.Entity.WsUserController:IsFacingLeft())
	if (not _UtilLogic:IsNilorEmptyString(asset)) then
		msp:SetAssetAnimation(asset, wzEffect)
	else
		msp:SetWzSprite(wzEffect, true)
	end
	sprite.Enable = true
end
end