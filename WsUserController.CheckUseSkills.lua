return function (self,ignoreCooldown) 
if (not self.Entity.WsUser:IsAvailablePlayerMovement()) then
	return
end
--맵 이동 중 액션 막을려고. 근데 다른 방법 찾아야할듯
--if (not self.Entity.MovementComponent.Enable) then
--    return
--end
local time = _UtilLogic.ElapsedSeconds
local cooltimes = _InputManager.SkillInputCooltime
for func,_ in pairs(_InputManager.SkillInputs) do
	local lastProceed = cooltimes[func] or 0
	if (time - lastProceed > 0.1 or ignoreCooldown) then
		-- log(func, " -> ", true, " / ", time - lastProceed)
		cooltimes[func] = time + 0.1
		_PlayerActiveSkillLogic:DoActiveSkill(func, false)
		_InputManager:MarkNoKeyInputFuncKey(_FuncKeyTypes.System, _FuncKeySystemType.PickUp)
	end
end
end