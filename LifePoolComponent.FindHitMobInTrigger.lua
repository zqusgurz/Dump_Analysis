return function (self,findOrigin,trigger,result) 
local simulator = _CollisionService:GetSimulator(trigger.Entity)
local pos = findOrigin:ToVector2() + trigger.ColliderOffset
local count = simulator:OverlapAllFast(CollisionGroups.MapleMob, BoxShape(pos, trigger.BoxSize, 0), result)
--log("Origin:", pos, "BoxSize:", trigger.BoxSize, "count:", count)
return count
end