return function (self,bgm) 
if (_UtilLogic:IsNilorEmptyString(bgm)) then
	self.Entity.SoundComponent:Stop()
	return
end
local sound = self.SpecializedBGM[bgm]

if not (sound) then
	local sp = _UtilLogic:Split(bgm, "/")
	local bgmCollection = _ResourceMan:ParseGenericWzCollection("Sound", sp[1])
	sound = bgmCollection[sp[2]]
end

if (sound == nil) then
	self.Entity.SoundComponent:Stop()
	return
end
if (self.Entity.SoundComponent.AudioClipRUID == sound) then
	return
end
self.Entity.SoundComponent:SetListenerEntity(_UserService.LocalPlayer)
self.Entity.SoundComponent.AudioClipRUID = sound
self.Entity.SoundComponent:Play()
--log("Play BGM", bgm, sound)
end