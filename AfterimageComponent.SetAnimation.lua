return function (self,actionRoot,left) 
for i=0,16 do
	local motion = actionRoot[tostring(i)]
	if (motion ~= nil) then
		self.AfterimageFrame = i
		self.Entity.MapleSpriteRendererComponent.DefaultAnimationDelay = 150
		self.Entity.MapleSpriteRendererComponent.Loop = false
		self.Entity.MapleSpriteRendererComponent:SetWzSprite(motion, true)
		self.Entity.MapleSpriteRendererComponent:SetFacingLeft(left)
		break
	end
end
end