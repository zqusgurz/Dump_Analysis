return function (self,hit) 
local hitEffectData = _EffectLogic:GetHitEffect(hit.SkillId, hit.SkillLevel, hit.WeaponType, hit.PlayerAction, hit.AttackMobIndex)
local hitOffset = hit.HitOffset:ToVector3()

-- 타격 위치에 고정 이펙트
local hitEffect = self:GetFixedHitEffectEntity()
local hitEffectPos = self.Entity.TransformComponent.WorldPosition + hitOffset
hitEffect.TransformComponent.WorldPosition = hitEffectPos

-- 기존 코드
--hitEffect = self:GetHitEffectEntity()
--if (hit.SkillId == _Skills.NOVICE_THROW_SNAIL) then -- 왜..
--    hitOffset.y = 0
--end
--hitEffect.TransformComponent.Position = hitOffset

local hitSprite = hitEffect.MapleSpriteRendererComponent
local hitSpriteRenderer = hitSprite:GetRenderer()
hitSpriteRenderer.SortingLayer = self.Entity.SpriteRendererComponent.SortingLayer
hitSpriteRenderer.OrderInLayer = 3
hitSprite:SetWzSprite(hitEffectData, true)
self.RegisteredHitEffect -= 1
end