return function (self,pos) 
local effect = _EffectLogic.EffectCache["TombFall"]
local sound = _EffectLogic.SoundGame["Tombstone"]
local sprite = self:GetUnderEffectLayer("Tomb")

sprite.TransformComponent.WorldPosition = pos + Vector3(0, 6, 0)
_TweenLogic:MoveOffset(sprite, Vector2(0,-6), 0.88, EaseType.Linear)
sprite.MapleSpriteRendererComponent:GetSpriteEntity().SpriteRendererComponent.Color.a = 1
sprite.MapleSpriteRendererComponent:SetWzSprite(effect, true)
_SoundService:PlaySoundAtPos(sound, self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
end