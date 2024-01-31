return function (self) 
local cd = _UserService.LocalPlayer.WsCharacterData
if (self.CurrentTab == 1) then
	self.SkillPoint.Text = tostring(cd:GetNoviceSkillPoint())
else
	self.SkillPoint.Text = tostring(cd.Sp)
end
end