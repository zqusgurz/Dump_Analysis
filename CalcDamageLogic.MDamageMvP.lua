return function (self,user,mob,mobAttack,rand) 
local cd = user.WsCharacterData
local bs = user.WsBasicStat
local ss = user.WsSecondaryStat
local ts = user.PlayerTemporaryStat
local mts = mob.MobTemporaryStat
local template = mob.MobComponent:GetTemplate()

local mad = template.MADamage + mts:GetValue(_MTS.Mad)
mad = math.max(0, math.min(_PlayerStatLogic.MaxMad, mad))
local minr = mad * 0.75
local maxr = mad * 0.8
local r = _NumberUtils:GetRand(rand, minr, maxr)
local userMDD = math.max(0, math.min(_PlayerStatLogic.MaxMdd, ss.Mdd + ts:GetValue(_CTS.Mdd)))
local t = r * mad * 0.01
local base = (bs.Str / 7) + (bs.Luk / 5) + (bs.Dex / 6) + userMDD
local mod
if (_Jobs:GetJobClass(cd.Job) == 2) then
	mod = base * 0.3
else
	mod = base * 0.25
end
local damage = t - mod
local reduce = 0
if (ts:GetValue(_CTS.MesoGuard)) then
	reduce = self:GetMesoGuardReduce(cd, damage)
end
local magicUp = mts:GetValue(_MTS.MagicUp)
if (magicUp ~= 0) then
	damage = magicUp * damage / 100
end
damage = math.floor(damage)
return math.min(self.MaxDamage, math.max(1, damage)), reduce
end