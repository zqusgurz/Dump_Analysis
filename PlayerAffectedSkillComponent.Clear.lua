return function (self) 
if (self.RotationUpdateTimer > -1) then
	_TimerService:ClearTimer(self.RotationUpdateTimer)
	self.RotationUpdateTimer = -1
end
if (self.DelayedUpdateTimer > -1) then
	_TimerService:ClearTimer(self.DelayedUpdateTimer)
	self.DelayedUpdateTimer = -1
end
for i=1,#self.AffectedList do
	self:ReleaseEntry(self.AffectedList[i])
end
self.AffectedList = {}
self.CurrentRotationIndex = 0
end