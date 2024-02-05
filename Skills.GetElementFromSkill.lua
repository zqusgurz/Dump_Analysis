return function (self,skillId) 
if (skillId == self.KNIGHT_BLIZZARD_CHARGE_SWORD) then
	return _ElementType.Ice
elseif (skillId == self.KNIGHT_ICE_CHARGE_MACE) then
	return _ElementType.Ice
elseif (skillId == self.KNIGHT_FLAME_CHARGE_SWORD) then
	return _ElementType.Fire
elseif (skillId == self.KNIGHT_FIRE_CHARGE_MACE) then
	return _ElementType.Fire
elseif (skillId == self.KNIGHT_LIGHTNING_CHARGE_MACE) then
	return _ElementType.Light
elseif (skillId == self.KNIGHT_THUNDER_CHARGE_SWORD) then
	return _ElementType.Light
end
return _ElementType.Physical
end