return function (self,user) 
local cd = user.WsCharacterData
local weapon = cd:GetEquippingWeaponId()
if (weapon == nil) then
	return 0, 0
end
local wt = _Items:GetWeaponType(weapon)
if (wt == 0) then
	return 0, 0
end
local bs = user.WsBasicStat
local _, bulletItemId = _BulletConsumeLogic:GetProperBulletPosition(cd, 0, 0, nil)
local pad = self:GetUserPAD(user, bulletItemId)

local primaryMin = 0
local primaryMax = 0
local secondaryMin = 0
local secondaryMax = 0
if (wt == _WeaponType.OneHandedSword) then
	primaryMin = bs.Str * 4
	secondaryMin = bs.Dex
	primaryMax = bs.Str * 4
	secondaryMax = bs.Dex
elseif (wt == _WeaponType.OneHandedAxe or wt == _WeaponType.OneHandedMace or wt == _WeaponType.Wand or wt == _WeaponType.Staff) then
	primaryMin = bs.Str * 3.2
	secondaryMin = bs.Dex
	primaryMax = bs.Str * 4.4
	secondaryMax = bs.Dex
elseif (wt == _WeaponType.TwoHandedSword) then
	primaryMin = bs.Str * 4.6
	secondaryMin = bs.Dex
	primaryMax = bs.Str * 4.6
	secondaryMax = bs.Dex
elseif (wt == _WeaponType.TwoHandedAxe or wt == _WeaponType.TwoHandedMace) then
	primaryMin = bs.Str * 3.4
	secondaryMin = bs.Dex
	primaryMax = bs.Str * 4.8
	secondaryMax = bs.Dex
elseif (wt == _WeaponType.Spear or wt == _WeaponType.PoleArm) then
	primaryMin = bs.Str * 3
	secondaryMin = bs.Dex
	primaryMax = bs.Str * 5
	secondaryMax = bs.Dex
elseif (wt == _WeaponType.Dagger or wt == _WeaponType.ThrowingGlove) then
	if (_Jobs:GetJobClass(cd.Job) == 4) then
		primaryMin = bs.Luk * 3.6
		secondaryMin = bs.Str + bs.Dex
		primaryMax = bs.Luk * 3.6
		secondaryMax = bs.Str + bs.Dex
	else
		primaryMin = bs.Str * 4
		secondaryMin = bs.Dex
		primaryMax = bs.Str * 4
		secondaryMax = bs.Dex
	end
elseif (wt == _WeaponType.Bow) then
	primaryMin = bs.Dex * 3.4
	secondaryMin = bs.Str
	primaryMax = bs.Dex * 3.4
	secondaryMax = bs.Str
elseif (wt == _WeaponType.Crossbow) then
	primaryMin = bs.Dex * 3.6
	secondaryMin = bs.Str
	primaryMax = bs.Dex * 3.6
	secondaryMax = bs.Str
end

local param = self:MakeIncOutParam()
local mastery = _MasteryLogic:GetWeaponMastery(user, wt, -1, 0, param)
pad += param.IncPAD

local minr = 0.9 * (10 + 5 * mastery) / 100
local min = (primaryMin * minr + secondaryMin) * pad / 100
local max = (primaryMax + secondaryMax) * pad / 100

max = math.max(1, math.min(self.MaxDamage, max))
min = math.max(1, math.min(self.MaxDamage, min))
return min, max
end