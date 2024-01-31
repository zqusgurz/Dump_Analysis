return function (self,event) 
local sp = self:GetSpriteEntity()
if (not self.Loop) then
	sp.SpriteRendererComponent.StartFrameIndex = self._T.EndFrame
	sp.SpriteRendererComponent.EndFrameIndex = self._T.EndFrame
	sp.SpriteRendererComponent.PlayRate = 0
end
--log("EndFrame Sprite Anim")
sp:DisconnectEvent(SpriteAnimPlayerEndFrameEvent, self._T.EndFrameHandler)
end