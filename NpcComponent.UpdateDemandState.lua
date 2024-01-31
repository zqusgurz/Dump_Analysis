return function (self,questId,demandState) 
---@type table<integer>
local startDemandQuests = _QuestMan.NpcToStartDemand[self.NpcTemplateID]
---@type table<integer>
local completeDemandQuests = _QuestMan.NpcToCompleteDemand[self.NpcTemplateID]

local foundAny = false
---@type QuestDemand
local startDemand = _QuestMan.StartDemand[questId]
---@type QuestDemand
local completeDemand = _QuestMan.CompleteDemand[questId]
if (not startDemand or not completeDemand) then
	return
end
local startNpc = startDemand.Npc
local completeNpc = completeDemand.Npc

if (startDemandQuests and _TableUtils:Contains(startDemandQuests, questId)) then
	self:MakeDemandState(questId, demandState, true, startNpc, completeNpc)
	foundAny = true
end
if (completeDemandQuests and _TableUtils:Contains(completeDemandQuests, questId)) then
	self:MakeDemandState(questId, demandState, false, startNpc, completeNpc)
	foundAny = true
end

if (foundAny) then
	--log(string.format("Npc %d received quest %d demand state: %d", self.NpcTemplateID, questId, demandState))
	local balloonState = -1
	if (_TableUtils:GetLength(self.LocalQuest_NearComplete) > 0) then
		balloonState = 2
	elseif (_TableUtils:GetLength(self.LocalQuest_AvailableStart) > 0) then
		balloonState = 0
	elseif (_TableUtils:GetLength(self.LocalQuest_InProgress) > 0) then
		balloonState = 1
	end
	if (balloonState == -1) then
		self.Entity.ChatBalloonComponent.Enable = true
	else
		self.Entity.ChatBalloonComponent.Enable = false
	end
	self.BalloonState = balloonState
	self:MakeQuestIcon(balloonState)
	_AppService:Get().ControlWindowMan.MaxMap.MiniMapComponent:UpdateNpc(self.NpcTemplateID)
	_AppService:Get().ControlWindowMan.MinMap.MiniMapComponent:UpdateNpc(self.NpcTemplateID)
end
end