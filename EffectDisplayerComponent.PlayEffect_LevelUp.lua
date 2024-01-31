return function (self) 
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return
end
local effect = _EffectLogic.EffectCache["LevelUp"]
local sound = _EffectLogic.SoundGame["LevelUp"]
local sprite = self:GetOverEffectLayer("LevelUp")

sprite.MapleSpriteRendererComponent.DisappearWhenAnimationOnceEnd = true
sprite.MapleSpriteRendererComponent:SetWzSprite(effect, true)
_SoundService:PlaySoundAtPos(sound, self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
end