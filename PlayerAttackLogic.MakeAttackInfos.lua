return function (self,attackCount,origin,attackBox,hitPtTable,targetComponents,attacks) 

for i=1,#targetComponents do
	---@type Entity
	local mob = targetComponents[i].Entity
	local hitPt = self:GetHitPointFromTable(mob, hitPtTable, attackBox)
	---@type AttackInfo
	local a = {
		Mob = mob,
		HitAction = 0,
		DamagePerMob = 0,
		DamageCli = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		CriticalCli = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false},
		Distance = hitPt:Distance(origin:ToVector2()),
		HitOffset = hitPt - mob.TransformComponent.WorldPosition:ToVector2(),
		HitPosition = mob.TransformComponent.WorldPosition:ToVector2(),
		DelayBase = 0,
		State = mob.StateComponent.CurrentStateName,
		DamageSvr = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		CriticalSvr = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false},
		DeadMob = nil,
		AdditionalDelay = 0,
		MobPos = mob.TransformComponent.WorldPosition:ToVector2(),
		Left = mob.MobComponent:IsFacingLeft()
	}
	attacks[i] = a
end
return attacks
end