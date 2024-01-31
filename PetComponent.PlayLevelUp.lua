return function (self) 
local anim = _UidMan:GetAnimation("Effect/PetEff.img/Basic/LevelUp")
_EffectService:PlayEffectAttached(anim, self.Entity, Vector3.zero, 0, Vector3.one)
local sound = _UidMan:Get("Sound/Game.img/LevelUp")
_SoundService:PlaySoundAtPos(sound, self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
end