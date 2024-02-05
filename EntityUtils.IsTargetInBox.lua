return function (self,origin,box,target) 
local simulator = _CollisionService:GetSimulator(origin)
---@type table<TriggerComponent>
local output = {}
local cnt = simulator:OverlapAllFast(CollisionGroups.Player, box, output)
if (cnt > 0) then
	for i=1,cnt do
		local user = output[i].Entity
		if (user.WsUser:IsDied()) then
			continue
		end
		if (user == target) then
			return true
		end
	end
end
return false
end