return function (self,user,mob,mobAttack,rand) 
local cd = user.WsCharacterData
local bs = user.WsBasicStat
local ss = user.WsSecondaryStat
local ts = user.PlayerTemporaryStat
local mts = mob.MobTemporaryStat
local template = mob.MobComponent:GetTemplate()

local pad
if (mobAttack ~= nil) then
	pad = mobAttack.Pad + mts:GetValue(_MTS.Pad)
else
	pad = template.PADamage + mts:GetValue(_MTS.Pad)
end

pad = math.min(_PlayerStatLogic.MaxPad, math.max(0, pad))
local minr = pad * 0.8
local maxr = pad * 0.85
local r = _NumberUtils:GetRand(rand, minr, maxr)
local userPDD = math.min(_PlayerStatLogic.MaxPdd, math.max(0, ss.Pdd + ts:GetValue(_CTS.Pdd)))
local t = r * pad * 0.01
local jc = _Jobs:GetJobClass(cd.Job)
if (jc == 5) then
	jc = 0
end
local standardPDD = _StandardPDD:GetStandardPDD(jc, cd.Level)
local base
if (jc == 1) then
	local v0 = ((bs.Luk + bs.Dex) / 4) + (bs.Int / 9)
	local v1 = bs.Str * 2 / 7
	base = math.floor(v0 + v1)
else
	local v0 = (bs.Int / 9) + (bs.Dex * 2 / 7) + (bs.Str * 0.4)
	local v1 = bs.Luk / 4
	base = math.floor(v0 + v1)
end
local mod = base * 0.00125
local fac
if (userPDD < standardPDD) then
	local opt = (cd.Level / 550) + mod + 0.28
	if (cd.Level >= template.Level) then
		fac = opt * (userPDD - standardPDD) * 13 / ((cd.Level - template.Level) + 13)
	else
		fac = opt * (userPDD - standardPDD) * 1.3
	end
else
	fac = (base / 900) + ((cd.Level / 1300) + 0.28) * (userPDD - standardPDD) * 0.7
end
local invincible = ts:GetValue(_CTS.Invincible)
local def = t - (fac + (mod + 0.28) * userPDD)
local damage = def - invincible * def / 100
local reduce = 0
if (ts:GetValue(_CTS.MesoGuard)) then
	reduce = self:GetMesoGuardReduce(cd, damage)
end
local powerUp = mts:GetValue(_MTS.PowerUp)
if (powerUp ~= 0) then
	damage = powerUp * damage / 100
end
damage = math.floor(damage)
return math.min(self.MaxDamage, math.max(1, damage)), reduce
end