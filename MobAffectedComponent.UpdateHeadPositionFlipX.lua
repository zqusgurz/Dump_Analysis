return function (self) 
local headGroup = self.HeadGroup
if (headGroup) then
	local newHeadPos = self.CurrentHeadPosBase:Clone()
	if (self.Entity.SpriteRendererComponent.FlipX) then
		newHeadPos.x = math.abs(newHeadPos.x)
	else
		newHeadPos.x = -math.abs(newHeadPos.x)
	end
	headGroup.TransformComponent.Position = newHeadPos
end
end