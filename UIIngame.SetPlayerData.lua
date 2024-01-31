return function (self) 
if self.job ~= "" and self.lv ~= 0 then
	self.dt:GetChildByName("LevelShow").TextComponent.Text = tostring(self.lv)
	self.dt:GetChildByName("LevelInput").SliderComponent.Value = self.lv
	self.dt:GetChildByName("JobList").TextComponent.Text = self.job
	_UserService.LocalPlayer.PlayerData:UpdateLvJob(self.lv, self.job)
end
end