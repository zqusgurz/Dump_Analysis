return function (self) 
local nowInAlert = _UtilLogic.ElapsedSeconds < self.AlertTime
if (self.Alert ~= nowInAlert) then
	self.Alert = nowInAlert
end
if (self:IsInAlert()) then
	local sc = self.Entity.StateComponent
	if (sc.CurrentStateName == "IDLE") then
		self.Entity.StateComponent:ChangeState("ALERT")
	end
else
	local sc = self.Entity.StateComponent
	if (sc.CurrentStateName == "ALERT") then
		self.Entity.StateComponent:ChangeState("IDLE")
	end
end
end