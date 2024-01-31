return function (self) 
local txt = _QuestMan.QuestName[self.QuestId] or ""
self.Info.Text = txt
self.__AlarmComponent__.Show(self)
end