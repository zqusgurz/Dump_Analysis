return function (self,event) 
local CurrentStateName = event.CurrentStateName
local PrevStateName = event.PrevStateName
--log(string.format("Npc %d   %s -> %s", self.NpcTemplateID, PrevStateName, CurrentStateName))
local animations = self.Entity.StateAnimationComponent
local animKey = animations:StateStringToAnimationKey(CurrentStateName)
local success, animationClip = animations.ActionSheet:TryGetValue(animKey)
if (success) then
	self.Entity.SpriteRendererComponent.SpriteRUID = animationClip
end
end