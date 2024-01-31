return function (self) 
---@type Tweener
local tweener = self.FadeInTweener
if (tweener ~= nil) then
	tweener:Destroy()
	tweener = nil
end
end