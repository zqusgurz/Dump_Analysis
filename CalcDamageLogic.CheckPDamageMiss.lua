return function (self,user,mob,rand) 
local cd = user.WsCharacterData
local ss = user.WsSecondaryStat
local ts = user.PlayerTemporaryStat
local mts = mob.MobTemporaryStat
local template = mob.MobComponent:GetTemplate()

local eva = ss.Eva + ts:GetValue(_CTS.Eva)
if (eva <= 0) then eva = 0 end
if (eva >= 999) then eva = 999 end
local level = cd.Level
local finalEva
if (level >= template.Level) then
	finalEva = eva
else
	eva -= ((template.Level - level) // 2)
	if (eva > 0) then
		finalEva = eva
	else
		finalEva = 0
	end
end
local mobAcc = template.Acc + mts:GetValue(_MTS.Acc)
if (mobAcc <= 0) then mobAcc = 0 end
if (mobAcc >= 999) then mobAcc = 999 end
local rate = finalEva / (mobAcc * 4.5) * 100
if (_Jobs:GetJobClass(cd.Job) == 4) then
	if (rate <= 5) then
		rate = 5
	end
	if (rate >= 95) then
		rate = 95
	end
else
	if (rate <= 2) then
		rate = 2
	end
	if (rate >= 80) then
		rate = 80
	end
end
local r = _NumberUtils:GetRand(rand, 0, 100)
--log(string.format("miss %d < %d (acc:%d eva:%d)", r, rate, mobAcc, finalEva))
return r < rate
end