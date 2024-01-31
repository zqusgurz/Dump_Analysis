return function (self,success) 
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return
end
if (success) then -- Success
	_EffectService:PlayEffectAttached("cf3ab1425a2541ac9e186c6bb46a057d", self.Entity, Vector3.zero, 0, Vector3.one)
	_SoundService:PlaySoundAtPos(_UidMan:Get("Sound/Game.img/EnchantSuccess"), self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
else -- Failed / Cursed
	_EffectService:PlayEffectAttached("50ef2618c45a40b68304f7ad0a873d3e", self.Entity, Vector3.zero, 0, Vector3.one)
	_SoundService:PlaySoundAtPos(_UidMan:Get("Sound/Game.img/EnchantFailure"), self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
end
end