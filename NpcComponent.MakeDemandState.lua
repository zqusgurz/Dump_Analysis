return function (self,questId,demandState,isStartDemandNpc,startNpc,completeNpc) 
-- 1순위 :책 (완료 가능)
-- 2순위 :전구 (시작 가능)
-- 3순위 :책펼침 (진행중)

-- BalloonState
-- -1: 없음
--  0: 전구
--  1: 진행중
--  2: 완료가능

local function setState(to)
	if (to == 0) then
		self.LocalQuest_AvailableStart[questId] = true
		self.LocalQuest_InProgress[questId] = nil
		self.LocalQuest_NearComplete[questId] = nil
	elseif (to == 1) then
		self.LocalQuest_AvailableStart[questId] = nil
		self.LocalQuest_InProgress[questId] = true
		self.LocalQuest_NearComplete[questId] = nil
	elseif (to == 2) then
		self.LocalQuest_AvailableStart[questId] = nil
		self.LocalQuest_InProgress[questId] = nil
		self.LocalQuest_NearComplete[questId] = true
	else
		self.LocalQuest_AvailableStart[questId] = nil
		self.LocalQuest_InProgress[questId] = nil
		self.LocalQuest_NearComplete[questId] = nil
	end
end

if (demandState == _QuestDemandCheck.DemandState_AvailableStart) then
	if (isStartDemandNpc) then
		setState(0)
	else
		if (startNpc ~= completeNpc) then
			setState(-1)
		end
	end
elseif (demandState == _QuestDemandCheck.DemandState_InProgess) then
	if (isStartDemandNpc) then
		setState(1)
	else
		setState(1)
	end
elseif (demandState == _QuestDemandCheck.DemandState_NearComplete) then
	if (isStartDemandNpc) then
		setState(1)
	else
		setState(2)
	end
else
	setState(-1)
end
end