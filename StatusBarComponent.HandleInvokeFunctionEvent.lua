return function (self,event) 
-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------
if (Function == "Menu") then
	self:SetMenu(Entity, not self:IsEnabledMenu())
elseif (Function == "Quickslot") then
	self:OnToggleQuickslot()
elseif (Function == "Shortcut") then
	self:SetShortcut(Entity, not self:IsEnabledShortcut())
elseif (Function == "Exit") then
	self:OnExit()
end
end