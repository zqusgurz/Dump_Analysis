return function (self,npc,quest,check) 
local quests = self.NpcToQuest[npc]
if (quests == nil) then
	quests = {}
	self.NpcToQuest[npc] = quests
end
quests[#quests + 1] = quest

---@type table<integer, table<integer>>
local demands

if (check == 0) then
	demands = self.NpcToStartDemand[npc]
	if (demands == nil) then
		demands = {}
		self.NpcToStartDemand[npc] = demands
	end
	demands[#demands + 1] = quest
elseif (check == 1) then
	demands = self.NpcToCompleteDemand[npc]
	if (demands == nil) then
		demands = {}
		self.NpcToCompleteDemand[npc] = demands
	end
	demands[#demands + 1] = quest
end

end