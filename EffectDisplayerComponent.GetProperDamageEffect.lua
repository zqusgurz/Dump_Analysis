return function (self,damage,critical,userToMob) 
if (damage < 0) then
	return _EffectLogic.EffectCache["NoBlue0"]
elseif (damage == 0) then
	return userToMob and _EffectLogic.EffectCache["NoRed0Miss"] or _EffectLogic.EffectCache["NoViolet0Miss"]
else
	if (userToMob) then
		return critical and _EffectLogic.EffectCache["NoCri1"] or _EffectLogic.EffectCache["NoRed0"]
	end
	return _EffectLogic.EffectCache["NoViolet0"]
end
end