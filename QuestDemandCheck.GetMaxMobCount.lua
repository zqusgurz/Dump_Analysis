return function (self,qid,index) 
---@type QuestDemand
local completeDemand = _QuestMan.CompleteDemand[qid]
if (completeDemand == nil) then
	return 0
end
local mob = completeDemand.Mob[index]
if (mob == nil) then
	log_error(string.format("qid %d  mob index %d   completedemand is nil", qid, index))
	return 0
end
return mob.count
end