return function (self,pos) 
-- log(string.format("Quest Select: %s [%d]", _QuestMan.QuestName[self.QuestId] or "알 수 없음", self.QuestId))
_QuestMan:SendEvent(ChangedSelectedQuestEntryEvent(self.Entity, self.Tab))
end