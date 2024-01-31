return function (self,event) 
if (self:IsClient()) then
	self:UpdateFoothold()
end
self.LastFoothold = event.Foothold.Id
end