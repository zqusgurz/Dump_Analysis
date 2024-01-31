return function (self,questId) 
local root = self:GetPositionRoot()
local alarm = _ObjectPool:Pick(self.QuestAlarmPool, "PooledQuestAlarm", "model://15f7db86-2ac2-4659-8b4f-07b4d5f3acde", Vector3.zero, root)
alarm.UITransformComponent.anchoredPosition = Vector2.zero
local q = alarm.QuestAlarmComponent
q.QuestId = questId
q:Show()
end