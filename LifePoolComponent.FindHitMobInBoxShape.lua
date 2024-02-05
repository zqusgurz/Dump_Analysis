return function (self,boxShape,result,excepts,onlyUndead) 
local simulator = _CollisionService:GetSimulator(self.Entity)
local temp = {}
local count = 0

-- _UserService.LocalPlayer.EffectDisplayerComponent:DrawBoxShape(1234, boxShape)

simulator:OverlapAllFast(CollisionGroups.MapleMob, boxShape, temp)
for _,e in ipairs(temp) do
	if (not e.Enable) then
		continue
	end
	---@type MobComponent
	local mob = e.Entity.MobComponent
	if (mob.DeadType ~= -1) then
		continue
	end
	if (excepts ~= nil) then
		for _,x in ipairs(excepts) do
			if (e.Entity.Id == x.Entity.Id) then
				goto CONTINUE
			end
		end
	end
	if (onlyUndead) then
		if not (mob:GetTemplate().Undead) then
			continue
		end
	end
	result[#result + 1] = e
	count += 1
	::CONTINUE::
end
return count
end