return function (self,event) 
local Function = event.Function
if (Function == "Cancel") then
	self.Entity.Enable = false
elseif (Function == "Ok") then
	self:Save()
end
end