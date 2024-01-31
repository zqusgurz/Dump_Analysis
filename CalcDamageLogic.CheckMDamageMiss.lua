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
local b = finalEva * 0.1
local a = finalEva
local r = _NumberUtils:GetRand(rand, b, a)
local mobAcc = template.Acc + mts:GetValue(_MTS.Acc)
if (mobAcc <= 0) then mobAcc = 0 end
if (mobAcc >= 999) then mobAcc = 999 end
return r >= mobAcc
end