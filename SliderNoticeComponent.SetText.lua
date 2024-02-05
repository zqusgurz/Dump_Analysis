return function (self,text) 
if (_UtilLogic:IsNilorEmptyString(text)) then
	self.Entity.Enable = false
	self.Text.Enable = false
	self.Text.Visible = false
	self:SetTween(false)
else
	self.Entity.Enable = true
	self.Text.Enable = true
	local textWidth = self.Text.TextComponent:GetPreferredWidth(text) + 200
	self.Text.UITransformComponent.RectSize.x = textWidth
	self.Text.UITransformComponent.anchoredPosition.x = textWidth
	_UpdateComponentLogic:InsertUpdateVisible(self.Text)
	self:SetTween(true)
end
self.Text.TextComponent.Text = text
end