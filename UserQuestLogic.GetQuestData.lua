return function (self,cd,questId) 
local ret = cd.QuestStarted[questId]
return ret or ""
end