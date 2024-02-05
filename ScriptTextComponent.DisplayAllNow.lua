return function (self) 
if (not self.HasTextAnimation) then
	return
end
_TimerService:ClearTimer(self.AnimationSpriteTimer)
local sprites = self.AnimationSprites
for i=1,#sprites do
	self:EnableAnimationSpriteAtIndex(sprites, i)
end
end