return function (self) 
if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("퀘스트 데이터"))
end
local begin = os.clock()
self:Load()
_Log:Info(string.format("Loaded %d quests (%.2f secs)", self.QuestNum, os.clock() - begin))
end