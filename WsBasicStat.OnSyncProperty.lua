return function (self,name,value) 
local localUser = _UserService.LocalPlayer
if (localUser == nil or self.Entity.OwnerId == localUser.OwnerId) then
	-- 클라이언트가 로드 되었건 안되었건 모두 문제 없이 사용할 수 있다.
	_AppService.ClientUpdateFlag |= _ChangedClientFlag.BasicStat
end
end