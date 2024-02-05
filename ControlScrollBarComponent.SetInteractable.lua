return function (self,b) 
--log(self.Entity.Path, "set interactible", b)

local size = self.Entity.UITransformComponent.RectSize
local vertical = size.y > size.x

if (self:_IsVertical()) then
	--log(self.Entity.Path, "set interactible vertical")
	if (b) then
		self._buttonNext.SpriteGUIRendererComponent.ImageRUID = self._vbarNextEnabledRUID
		self._buttonPrev.SpriteGUIRendererComponent.ImageRUID = self._vbarPrevEnabledRUID
		self._barBase.SpriteGUIRendererComponent.ImageRUID = self._vbarBaseEnabledRUID
	else
		self._buttonNext.SpriteGUIRendererComponent.ImageRUID = self._vbarNextDisabledRUID
		self._buttonPrev.SpriteGUIRendererComponent.ImageRUID = self._vbarPrevDisabledRUID
		self._barBase.SpriteGUIRendererComponent.ImageRUID = self._vbarBaseDisabledRUID
	end
else
	--log(self.Entity.Path, self.Entity.UITransformComponent.RectSize)
end
self._barHandle.SpriteGUIRendererComponent.Enable = b
self.Interactable = b
end