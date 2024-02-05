return function (self,id) 
local template = _NpcTemplateMan:GetNpcTemplate(self.NpcTemplateID)
local needServer = template.Shop or (template.Script ~= nil and template.Script ~= "")

if (id == 0) then
	if (needServer) then
		_UserService.LocalPlayer.ScriptMachineComponent:OnConversationWithNpc(self.Entity)
	end
else
	local state = _QuestConversationLogic:NewState(self.NpcTemplateID, id, false)
	_QuestConversationLogic:BeginConversation(state)
end
end