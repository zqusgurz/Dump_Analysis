return function (self,selected) 
if (selected) then
	self.SelectedBackground.Entity.Enable = true
	self.Title.FontColor = Color.white
else
	self.SelectedBackground.Entity.Enable = false
	if (self.Tab == 0 and _QuestMan:IsWorthless(_UserService.LocalPlayer.WsCharacterData, self.QuestId)) then	
		self.Title.FontColor = Color(0.74,0.74,0.74)
	else
		self.Title.FontColor = Color(0.2,0.2,0.2)
	end
end
end