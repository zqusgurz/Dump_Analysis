return function (self,delta) 
local expire = self.ReservedDestroy
if (expire == 0) then
	return
end
local now = _UtilLogic.ElapsedSeconds
if (now > expire) then
	self.ReservedDestroy = 1E1000
	self:BeginExpire()
	self.Entity.CurrentMap.DropPoolComponent._clientDropMap[self.DropId] = nil
end
end