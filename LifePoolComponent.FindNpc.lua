return function (self,npcTemplateId) 
for _,n in pairs(self.Npcs) do
	---@type NpcComponent
	local npc = n
	if (npc.NpcTemplateID == npcTemplateId) then
		return npc
	end
end
return nil
end