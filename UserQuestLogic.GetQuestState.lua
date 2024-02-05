return function (self,cd,questId) 
if (cd.QuestStarted[questId] ~= nil) then
	return 1
end
if (cd.QuestCompleted[questId] ~= nil) then
	return 2
end
return 0
end