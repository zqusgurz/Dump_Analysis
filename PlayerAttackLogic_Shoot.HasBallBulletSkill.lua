return function (self,skillId) 
if (skillId == 3121004 or 
	skillId == 5221007 or 
	skillId == _Skills.ARCHER_ARROW_BLOW or
	skillId == _Skills.HUNTER_ARROW_BOMB_BOW or
	skillId == _Skills.CROSSBOWMAN_IRON_ARROW_CROSSBOW) then
	return true
end
return false
end