return function (self,cd,questId) 
---@type QuestDemand
local startDemand = self.StartDemand[questId]
if (startDemand ~= nil) then
	if (startDemand.LvMin + 10 < cd.Level) then
		if (startDemand.End == nil) then		
			return true
		end
	end
end
return false
end