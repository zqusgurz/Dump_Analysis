return function (self) 
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return -- NOTE: useless?
end
local effect = _EffectLogic.EffectCache["JobChanged"]
local sound = _EffectLogic.SoundGame["JobChanged"]
local sprite = self:GetUnderEffectLayer("JobChanged")

sprite.MapleSpriteRendererComponent.DisappearWhenAnimationOnceEnd = true
sprite.MapleSpriteRendererComponent:SetWzSprite(effect, true)
_SoundService:PlaySoundAtPos(sound, self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
end