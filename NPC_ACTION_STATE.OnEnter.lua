return function (self) 
local parent = self.ParentComponent
local npc = parent.Entity
local state = parent.CurrentStateName
local id = npc.NpcComponent.NpcTemplateID
--log(string.format("Npc %d state is now %s", id, state))
if (state == "IDLE") then
	self.ActionEnd = 0
else
	---@type NpcTemplateAction
	local action = _NpcTemplateMan:GetNpcTemplate(id).Actions[string.lower(state)]
	self.ActionEnd = _UtilLogic.ServerElapsedSeconds + action.AnimationDuration
end
end