return function (self,cd,id,currentQuestState,forceEvent,muteAlarm) 
local demandState = self:GetDemandState(id)
local demandStates = self.QuestDemandState

local routine = self.StateRoutine[currentQuestState]
local currentDemandStateTable = routine[demandState]

local function tryChangeDemandState(target)
	if (demandStates[id] ~= target or forceEvent) then
		demandStates[id] = target
		local check = (currentQuestState == 1) and 1 or 0
		--log(string.format("ChangedQuestDemandState id:%d  demandState:%d  (check:%d)", id, target, check))
		self:SendEvent(ChangedQuestDemandState(id, target, check))
		if (not muteAlarm) then
			if (target == _QuestDemandCheck.DemandState_NearComplete) then
				_AppService:Get().AlarmMan:ShowQuestAlarm(id)
			end
		end
	end
end

if (currentDemandStateTable == nil) then
	currentDemandStateTable = routine[-1]
end

local checkResult = _QuestDemandCheck:Check(cd, id, currentDemandStateTable.check)

if (checkResult == _QuestCheckResult.Success) then
	tryChangeDemandState(currentDemandStateTable.success)
else
	tryChangeDemandState(currentDemandStateTable.failed)
end
end