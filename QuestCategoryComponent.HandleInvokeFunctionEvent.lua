return function (self,event) 
if (event.Function == "Collapse") then
	self.Spread = false
	self:Update()
	_AppService:Get().ControlWindowMan.Quest.QuestWindowComponent:AdjustCategoryPosition()
elseif (event.Function == "Spread") then
	self.Spread = true
	self:Update()
	_AppService:Get().ControlWindowMan.Quest.QuestWindowComponent:AdjustCategoryPosition()
end
end