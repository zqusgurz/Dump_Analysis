return function (self,templateID) 
local animations = self.NpcStandAnimation
local stand = animations[templateID]
if (stand) then
	return stand
end
local ds = _DataService:GetTable("NpcModel")
local found = ds:FindRow("ID", tostring(templateID))
if (found == nil) then
	log_error("not found npc model templateid", templateID)
	animations[templateID] = ""
	return ""
end
local model = found:GetItem("RUID")
if (_UtilLogic:IsNilorEmptyString(model)) then
	log_error("npc model empty", templateID)
	animations[templateID] = ""
	return ""
end
local obj = _SpawnService:SpawnByModelId(model, "Temp", Vector3(0, 0, 10000), nil)
local states = obj.StateAnimationComponent
if (isvalid(states)) then
	local h, st = states.ActionSheet:TryGetValue("stand")
	if (h) then
		animations[templateID] = st
	else
		animations[templateID] = ""
	end
else
	log_error("state animation component is nil")
end
obj:Destroy()
return animations[templateID]
end