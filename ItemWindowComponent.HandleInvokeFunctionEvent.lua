return function (self,event) 
self.__ControlWindowComponent__.HandleInvokeFunctionEvent(self, event)

local Function = event.Function
if (Function == "Tab1") then
	self.CurrentTab = 1
	self:InvalidateItems()
	self:SetFocus()
elseif (Function == "Tab2") then
	self.CurrentTab = 2
	self:InvalidateItems()
	self:SetFocus()
elseif (Function == "Tab3") then
	self.CurrentTab = 3
	self:InvalidateItems()
	self:SetFocus()
elseif (Function == "Tab4") then
	self.CurrentTab = 4
	self:InvalidateItems()
	self:SetFocus()
elseif (Function == "Tab5") then
	self.CurrentTab = 5
	self:InvalidateItems()
	self:SetFocus()
elseif (Function == "DropMeso") then
	_ItemDropLogic:DropMeso()
end
end