return function (self,event) 
local state = event.state

if (state == ButtonState.Hover and not _UtilLogic:IsNilorEmptyString(self.MouseOverSound)) then
	_SoundService:PlaySound(self.MouseOverSound, 1)
elseif (state == ButtonState.Clicked and not _UtilLogic:IsNilorEmptyString(self.ClickedSound)) then
	_SoundService:PlaySound(self.ClickedSound, 1)
end

--if (state == ButtonState.Hover) then
--    self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.HighlightedSprite
--elseif (state == ButtonState.Clicked) then
--    self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.PressedSprite
--elseif (state == ButtonState.Normal) then
--    self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.SelectedSprite
--elseif (state == ButtonState.Released) then
--    self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.SelectedSprite
--elseif (state == ButtonState.Pressed) then
--    self.Entity.SpriteGUIRendererComponent.ImageRUID = self.ImageRUIDs.PressedSprite
--end

--log("Button State:", state, self.Entity.SpriteGUIRendererComponent.ImageRUID.DataId)
end