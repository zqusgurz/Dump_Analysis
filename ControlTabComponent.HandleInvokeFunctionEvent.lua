return function (self,event) 
-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------

if (Function == "Close") then
	self:SetVisible(false, false)
end
end