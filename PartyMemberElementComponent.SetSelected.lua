return function (self,b) 
self.Selected.Enable = b
if (b) then
	self.LeaderIcon.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/UserList/Party/icon1")
	self.LeaderIcon.SpriteGUIRendererComponent.LocalPosition = Vector2.zero
	self.LeaderIcon.UITransformComponent.RectSize = Vector2(34, 32)
else
	self.LeaderIcon.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/UserList/Party/icon0")
	self.LeaderIcon.SpriteGUIRendererComponent.LocalPosition = Vector2(4, -3)
	self.LeaderIcon.UITransformComponent.RectSize = Vector2(26, 26)
end
self:UpdateFontColor()
end