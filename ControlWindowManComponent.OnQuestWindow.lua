return function (self) 
local questWin = self.Quest.QuestWindowComponent
questWin:SetVisible(not questWin:IsVisible(), true)
end