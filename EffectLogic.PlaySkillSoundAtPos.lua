return function (self,skillId,key,pos) 
local sound = self:GetSkillSound(skillId, key)
if (sound ~= nil) then
	_SoundService:PlaySoundAtPos(sound, pos, _UserService.LocalPlayer, 1)
end
end