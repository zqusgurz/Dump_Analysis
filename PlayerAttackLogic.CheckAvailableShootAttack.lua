return function (self,user,skillId,skillLevel) 
local weaponId = user.CharacterActionComponent.CurrentWeaponId
if (_Items:IsShootingWeapon(weaponId)) then
	local state = user.StateComponent.CurrentStateName
	if (state == "PRONE") then
		return false
	end
	local cd = user.WsCharacterData
	local ts = user.PlayerTemporaryStat
	local n
	if (skillId > 0 and skillLevel > 0) then
		n = _BulletConsumeLogic:GetProperBulletPosition(cd, skillId, skillLevel, nil)
	else
		n = _BulletConsumeLogic:GetProperBulletPosition(cd, 0, 0, nil)
	end
	--log(string.format("CheckProperBulletPosition pos=%d", n))
	if (n > 0 or ts:GetValue(_CTS.SoulArrow) > 0) then
		return true
	end
	if (skillId > 0 and skillLevel > 0) then
		local wt = _Items:GetWeaponType(cd:GetEquippingWeaponId())
		if (wt == _WeaponType.Crossbow or wt == _WeaponType.Bow) then
			_ChatMessageLogic:Add(_ChatMessageType.Red, "화살을 모두 소비하였습니다.")
		elseif (wt == _WeaponType.ThrowingGlove) then
			_ChatMessageLogic:Add(_ChatMessageType.Red, "표창을 모두 소비하였습니다.")
		end
	end
end
return false
end