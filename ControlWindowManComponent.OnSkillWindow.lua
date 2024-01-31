return function (self) 
local skillWin = self.Skill.SkillWindowComponent
skillWin:SetVisible(not skillWin:IsVisible(), true)
end