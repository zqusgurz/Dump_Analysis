return function (self) 
-- 나 자신은 HP바 보이면 안댕
if (self.Entity == _UserService.LocalPlayer) then
	return
end

local bar = self.HpBar
if (not isvalid(bar)) then
	local head = self.Entity.CharacterActionComponent.Head
	local b = _SpawnService:SpawnByModelId("model://215a5d6c-3372-4c48-85b0-50b65f06d845", "HpBar", Vector3.zero, head)
	b.UITransformComponent.Position = Vector3(0, 0.35, 0)
	b.UITransformComponent.Scale = Vector3(1.25, 1.25, 0)
	self.HpBar = b.EntityHpBarComponent
end
self.HpBar:UpdateGauge(self.Hp / self.MaxHp)
end