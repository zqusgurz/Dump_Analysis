return function (self,enabled) 
if (enabled) then
	self.Entity.MovementComponent.Enable = false
else
	self.Entity.MovementComponent.Enable = true
end
end