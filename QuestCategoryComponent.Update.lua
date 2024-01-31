return function (self) 
self:MakeQuestList()
---@type table<Entity>
local entities = self.QuestEntities
local questNum = #self.QuestIds
local entityNum = #entities
if (questNum > entityNum) then
	for i=entityNum+1,questNum do
		entities[i] = _SpawnService:SpawnByModelId("model://8760810d-a78e-428b-956b-107e2dd904bf", "PooledQuestEntry", Vector3.zero, self.QuestParent)
		entities[i].Enable = false
		--entities[i].Visible = false
	end
end

if (questNum > 0) then
	self:Render(true)
	self.BtSpread.Enable = not self.Spread
	self.BtCollapse.Enable = self.Spread
else
	self.Entity.Enable = false
	--self.Entity.Visible = false
	self.Height = 0
end
end