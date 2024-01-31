return function (self,z) 
--if (z < 0) then
--    return self:GetUnderEffectLayer("_SkillEffect")
--end
--return self:GetOverEffectLayer("_SkillEffect")

---@type function(s:any,pool:table,name:string,model:string,pos:Vector3,parent:Entity,enable:boolean): Entity, boolean
local pick = _ObjectPool.PickEx

---@type table<Entity>
local pool
if (z < 0) then
	pool = self.SkillEffectPoolUnder
else
	pool = self.SkillEffectPool
end

local picked, newOne = pick(_ObjectPool, pool, "SkillEffect", "model://6c13a597-644f-47d9-8310-11ddf6cc74bc", Vector3.zero, self.Entity, false)

local sp = picked.MapleSpriteRendererComponent
if (newOne) then
	if (z < 0) then
		sp.OrderInLayer = -1
		sp:GetSpriteEntity().SpriteRendererComponent.OrderInLayer = -1
	else
		sp.OrderInLayer = 5
		sp:GetSpriteEntity().SpriteRendererComponent.OrderInLayer = 5
        --sp.Layer = "Effect"
        --sp:GetSpriteEntity().SpriteRendererComponent.SortingLayer = "Effect"
	end
	sp.Loop = false
end

local avatarRenderer = self.Entity.AvatarRendererComponent
sp.Layer = avatarRenderer.SortingLayer
sp:GetSpriteEntity().SpriteRendererComponent.SortingLayer = avatarRenderer.SortingLayer

sp.ReleasePool = pool
picked.TransformComponent.Position = Vector3.zero
return picked
end