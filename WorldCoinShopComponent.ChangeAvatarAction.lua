return function (self,delta) 
self.CurrentAvatarAction += delta
if (self.CurrentAvatarAction <= 0) then
	self.CurrentAvatarAction = #self.AvatarActionTable
elseif (self.CurrentAvatarAction > #self.AvatarActionTable) then
	self.CurrentAvatarAction = 1
end
local action = self.AvatarActionTable[self.CurrentAvatarAction]
self.ActionText.Text = action[1]
local event = BodyActionStateChangeEvent()
event.ActionState = action[2]
self.Avatar:SendEvent(event)
end