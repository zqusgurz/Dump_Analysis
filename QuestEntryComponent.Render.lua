return function (self,questId,tab) 
local name = _QuestMan.SeriesQuest[questId] or _QuestMan.QuestName[questId] or "알 수 없음"
--local width = self.Title:GetPreferredWidth(name)
--if (width > 312) then
--    -- 원래는 .. 으로 ellipse 형태로 생략해줘야 하나.. 그런 기능은 메월드가 없다!
--    self.QuestFullName = name
--else
--    self.QuestFullName = ""
--end
self.Title.Text = name
self.QuestId = questId
self.Tab = tab
self:UpdateQuestIcon()
self:ChangedSelected(self.Selected)
end