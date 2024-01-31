return function (self,flag,data) 
local i = 1
if ((flag & _CharacterDataFlag.ItemSlotEqp) ~= 0) then
	self.ItemSlot[1] = data[i]
	i += 1
	self.Equipping = data[i]
	i += 1
	self.Equipping2 = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.ItemSlotCon) ~= 0) then
	self.ItemSlot[2] = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.ItemSlotIns) ~= 0) then
	self.ItemSlot[3] = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.ItemSlotEtc) ~= 0) then
	self.ItemSlot[4] = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.ItemSlotCash) ~= 0) then
	self.ItemSlot[5] = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.ItemMaxSlot) ~= 0) then
	self.ItemMaxSlot = data[i]
	_AppService.ClientUpdateFlag |= _ChangedClientFlag.ItemMaxSlot
	i += 1
end
if ((flag & _CharacterDataFlag.Skill) ~= 0) then
	self.Skill = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.QuestStarted) ~= 0) then
	self.QuestStarted = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.QuestCompleted) ~= 0) then
	self.QuestCompleted = data[i]
	i += 1
end
if ((flag & _CharacterDataFlag.SkillCooltime) ~= 0) then
	self.SkillCooltime = data[i]
	i += 1
end
if (flag ~= 0) then
	local pos, itemId = _BulletConsumeLogic:GetProperBulletPosition(self, 0, 0, nil)
	_BulletConsumeLogic.ActiveBulletPos = pos
	_BulletConsumeLogic.ActiveBulletItemId = itemId
end
end