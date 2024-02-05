return function (self,uol,attached,localPos,left,loop,destroyCallback) 
local map = _UserService.LocalPlayer.CurrentMap
local meta = _MetaAnimationMan.Frames[uol]

-- 굳이 이펙트 엔티티 할 필요가 없다
if (not meta and not destroyCallback) then
	local clip = _UidMan:GetAnimation(uol)
	if (not _UtilLogic:IsNilorEmptyString(clip)) then
		if (attached) then
			return _EffectService:PlayEffectAttached(clip, attached, localPos, 0, Vector3.one, loop, { FlipX = not left })
		else
			return _EffectService:PlayEffect(clip, map, localPos, 0, Vector3.one, loop, { FlipX = not left })
		end
	end
	return nil
end

local pool = self.EffectPool[map.Id]
if (not pool) then
	pool = {}
	self.EffectPool[map.Id] = pool
end
local entity = _ObjectPool:PickEx(pool, "Pooled Effect Entity", "model://ecf09508-ed7a-451a-9e2f-99c41498ae7d", Vector3.zero, map, false)
if (attached) then
	entity:AttachTo(attached)
else
	entity:AttachTo(map)
end
entity.EffectAnimationComponent:Begin(uol, localPos:Clone(), left, pool, destroyCallback, loop)
return entity
end