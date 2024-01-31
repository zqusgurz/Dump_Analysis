return function (self,questId,state,data,elapsed,checkSingleDemand) 
if (state == 0) then
	self.QuestStarted[questId] = nil
	self.QuestCompleted[questId] = nil
elseif (state == 1) then
	self.QuestCompleted[questId] = nil
	self.QuestStarted[questId] = data or ""
elseif (state == 2) then
	self.QuestStarted[questId] = nil
	self.QuestCompleted[questId] = elapsed
end
if (checkSingleDemand) then
	_LocalQuestMon:CheckSingleQuestForDemand(self, questId, state, false, false)
else
	_LocalQuestMon:CheckQuestDemandState(-1, false)
end
local questWindow = _AppService:Get().ControlWindowMan.Quest.QuestWindowComponent
if (questWindow:IsVisible()) then
	questWindow:OnChangeTab(questWindow.CurrentTab)
end
end