return function (self,itemId) 
local sound = _EffectLogic.SoundItem[itemId]
if not (_UtilLogic:IsNilorEmptyString(sound)) then
	_SoundService:PlaySound(sound, 1)
end
end