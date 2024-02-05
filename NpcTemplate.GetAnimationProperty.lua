return function (self,animation) 
local myAnim = self._property[animation]
if (myAnim == nil and self._linkObject ~= nil) then
	---@type NpcTemplate
	local linkOrigin = self._linkObject
	return linkOrigin:GetAnimationProperty(animation)
end
if (myAnim == nil) then
	--log("npc animation '" .. animation .. "' is nil")
end
return myAnim
end