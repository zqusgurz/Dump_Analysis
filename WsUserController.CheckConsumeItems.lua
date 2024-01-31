return function (self,ignoreCooldown) 
if (not self.Entity.WsUser:IsAvailableInventoryOperation()) then
	return
end
--맵 이동 중 액션 막을려고. 근데 다른 방법 찾아야할듯
--if (not self.Entity.MovementComponent.Enable) then
--    return
--end
local time = _UtilLogic.ElapsedSeconds
local cooltimes = _InputManager.ConsumeInputCooltime
for func,_ in pairs(_InputManager.ConsumeInputs) do
	local lastProceed = cooltimes[func] or 0
	if (time - lastProceed > 0.3 or ignoreCooldown) then
		log(func, " -> ", true, " / ", time - lastProceed)
		if (time - lastProceed > 1) then
			cooltimes[func] = time + 1
		else
			cooltimes[func] = time + 0.3
		end
		_ItemConsumeLogic:TryConsumeFromFuncKey(func)
	end
end
end