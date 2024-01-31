return function (self) 
if (isvalid(self.Entity.SpriteRendererComponent)) then
	self.Entity.SpriteRendererComponent.Enable = false
	self.UIMode = false
end
if (isvalid(self.Entity.SpriteGUIRendererComponent)) then
	self.Entity.SpriteGUIRendererComponent.Enable = false
	self.UIMode = true
end
end