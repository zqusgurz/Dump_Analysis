return function (self,state) 
local animations = self.Entity.StateAnimationComponent
local animKey = animations:StateStringToAnimationKey(state)
local success, animationClip = animations.ActionSheet:TryGetValue(animKey)
if (success) then
	local sprite = self.Entity.SpriteRendererComponent
	sprite.SpriteRUID = animationClip
	if (animKey == "die") then
		-- log(string.format("Change animation by state %s (Clip:%s) / animKey: ", state, animationClip), animKey)
		self:ConnectSpriteFrameChangedEvent(true, state)
	end
else
	--log_error(string.format("Failed to change animation by state %s / animKey: ", state), animKey)
end
end