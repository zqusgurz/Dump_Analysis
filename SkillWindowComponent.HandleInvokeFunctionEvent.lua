return function (self,event) 
-- Parent handler call
self.__ControlWindowComponent__.HandleInvokeFunctionEvent(self, event)

-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------

if (Function == "Tab1") then
	self:OnTabSelected(1)
elseif (Function == "Tab2") then
	self:OnTabSelected(2)
elseif (Function == "Tab3") then
	self:OnTabSelected(3)
elseif (Function == "Tab4") then
	self:OnTabSelected(4)
elseif (Function == "Tab5") then
	self:OnTabSelected(5)
end
end