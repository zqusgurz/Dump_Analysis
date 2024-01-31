return function (self) 
---@type table<Entity, any>
local waitings = self.WaitingEvents
local function checkWaitingEvents()
	local now = _UtilLogic.ElapsedSeconds
	for entity,data in pairs(waitings) do
		local event = data[1]
		local checkSize = data[2]
		local registeredTime = data[3]
		if (now - registeredTime > 0.2 or checkSize ~= _EntityUtils:GetRealRectSize(entity)) then
			entity:SendEvent(event)
			waitings[entity] = nil
		end
	end
end
_TimerService:SetTimerRepeat(checkWaitingEvents, 0.1, 1)
end