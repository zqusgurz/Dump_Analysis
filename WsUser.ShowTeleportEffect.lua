return function (self,pos,attached,fromUserId) 
if (fromUserId == _UserService.LocalPlayer.OwnerId) then
	return
end
local user = self.Entity

if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return -- NOTE: useless?
end

if (attached) then
	_EffectService:PlayEffectAttached("5c225fff42104a3ba3a45f2435ee08df", user, Vector3.zero, 0, Vector3.one)
else
	_EffectService:PlayEffect("5c225fff42104a3ba3a45f2435ee08df", user, pos, 0, Vector3.one)
end
end