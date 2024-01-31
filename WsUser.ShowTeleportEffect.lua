return function (self,pos,attached,fromUserId) 
if (fromUserId == _UserService.LocalPlayer.OwnerId) then
	return
end
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return
end
if (attached) then
	_EffectService:PlayEffectAttached("5c225fff42104a3ba3a45f2435ee08df", self.Entity, Vector3.zero, 0, Vector3.one)
else
	_EffectService:PlayEffect("5c225fff42104a3ba3a45f2435ee08df", self.Entity, pos, 0, Vector3.one)
end
end