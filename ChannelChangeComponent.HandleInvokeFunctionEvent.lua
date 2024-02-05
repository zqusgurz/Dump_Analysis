return function (self,event) 
local Function = event.Function
if (Function == "Cancel") then
	self.Entity.Enable = false
elseif (Function == "Change") then
	self:Change()
end
end