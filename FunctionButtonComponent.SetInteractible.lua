return function (self,b) 
if (b) then
	if (self.Transition == TransitionType.SpriteSwap) then
		self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.SelectedSprite
	elseif (self.Transition == TransitionType.ColorTint) then
		self.Entity.SpriteGUIRendererComponent.Color = self.Colors.NormalColor
	end
else
	if (self.Transition == TransitionType.SpriteSwap) then
		self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.DisabledSprite
	elseif (self.Transition == TransitionType.ColorTint) then
		self.Entity.SpriteGUIRendererComponent.Color = self.Colors.DisabledColor
	end
end
self.Enable = b
end