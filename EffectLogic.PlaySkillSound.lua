return function (self,skillId,key) 
local sound = self:GetSkillSound(skillId, key)
if (sound ~= nil) then
	_SoundService:PlaySound(sound, 1)
end
end