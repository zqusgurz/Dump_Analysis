return function (self,npcTemplateId) 
---@type QuestDemand
local startDemand = _QuestMan.StartDemand[self.SelectedQuestId]
if (startDemand and startDemand.Npc == npcTemplateId) then
	_PlayerCostumeLogic:UpdateImitationNpcLook(npcTemplateId, self.Avatar.CostumeManagerComponent)
end
end