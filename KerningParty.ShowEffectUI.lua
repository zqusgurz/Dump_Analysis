return function (self,correct) 
local focus = _UserService.LocalPlayer:GetChildByName("effectUI")
if correct then
	_EffectService:PlayEffectAttached("dab3d116601d4e0f8b5a3319fe1a55ef", focus, Vector3.zero, 0, Vector3.one)
	_SoundService:PlaySound("08e0a1c5a5374a31abf87769cc74a0d9", 1)
else
	_EffectService:PlayEffectAttached("4fa8ae8362124d078add5310f79bcd5a", focus, Vector3.zero, 0, Vector3.one)
	_SoundService:PlaySound("2fb2399e2860437ca07f4170ffc09d53", 1)
end
end