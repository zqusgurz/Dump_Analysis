return function (self,name,value) 
if (name == "DeadType") then
	if (value ~= -1) then
		self.Entity.TriggerComponent.Enable = false
		self:SetBodyAttackEnabled(false)
	end
end
end