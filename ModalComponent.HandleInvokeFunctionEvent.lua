return function (self,event) 
-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------

if (Function == "Yes") then
	self:OnYes()
elseif (Function == "No") then
	self:OnNo()
end
end