return function (self,pos) 
self.Spread = not self.Spread
self:Update()
_AppService:Get().ControlWindowMan.Quest.QuestWindowComponent:AdjustCategoryPosition()
_QuestMan:SendEvent(ChangedSelectedQuestEntryEvent(nil, self.Tab))
end