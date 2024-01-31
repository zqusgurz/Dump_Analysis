return function (self,skillId,mobId,die) 
if (skillId > 0 and not die) then
	local sound = self:GetSkillSound(skillId, "Hit")
	if (sound) then
		return sound
	end
end
local obj = self.SoundMob[mobId]
if (obj == nil) then return nil end
return obj[die and "Die" or "Damage"]
end