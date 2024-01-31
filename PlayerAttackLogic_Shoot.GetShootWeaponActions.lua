return function (self,weaponType,finalAttack) 
if (weaponType == _WeaponType.Bow) then
	if (finalAttack) then
	    return {_CharacterAction.SHOOTF}
	else
	    return {_CharacterAction.SHOOT1}
	end
elseif (weaponType == _WeaponType.Crossbow) then
	if (finalAttack) then
    	return {_CharacterAction.SHOOT2}
	else
    	return {_CharacterAction.SHOOT2}
	end
elseif (weaponType == _WeaponType.ThrowingGlove) then
    return {_CharacterAction.SWINGO1_SHOOT, _CharacterAction.SWINGO2_SHOOT, _CharacterAction.SWINGO3_SHOOT}
end
end