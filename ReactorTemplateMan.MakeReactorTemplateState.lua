return function (self,obj) 
local ret = {}
ret.State = tonumber(obj.Name)
ret.Animation = obj
ret.HitAnimation = obj["hit"]

local events = obj["event"]
if (events ~= nil) then
	for _,prop in _WzUtils:GetLabeled(events) do
		table.insert(ret.Events, self:MakeReactorTemplateStateEvent(prop))
	end
end

local totalDelay = 0
if (obj["hit"] ~= nil) then
	for _, hit in _WzUtils:GetLabeled(obj["hit"]) do
		totalDelay = totalDelay + _WzUtils:GetInt32(hit.delay, 120)
	end
end
ret.HitDelay = totalDelay

return ret
end