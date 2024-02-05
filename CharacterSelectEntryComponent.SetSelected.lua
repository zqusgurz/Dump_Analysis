return function (self,selected) 
if (selected and self.SummaryData == nil) then
	return
end
self.DownEffect.Enable = selected
self.CharacterInfo.Enable = selected
self.SelectEffect.Enable = selected
self:SetMoveState(selected)
self.Selected = selected
if (selected) then
	-- 처음부터 재생시키기 위해서
	self.SelectEffect.SpriteRendererComponent.EndFrameIndex -= 1
	self.SelectedTime = _UtilLogic.ElapsedSeconds
	self.NameText.FontColor = Color.white
	self:MakeTween(1)
else
	self.SelectedTime = 0
	self.NameText.FontColor = Color(0.5, 0.5, 0.5, 1)
	self:MakeTween(0)
end
end