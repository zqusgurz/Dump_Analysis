return function (self,event) 
if not (self.NextClimbAvailableWhenOnGround) then
  self.NextClimbAvailable = _UtilLogic.ElapsedSeconds + 0.3
else
  self.NextClimbAvailable = _UtilLogic.ElapsedSeconds + 2147483647
end
self.Entity.PlayerControllerComponent.FixedLookAt = 0
end