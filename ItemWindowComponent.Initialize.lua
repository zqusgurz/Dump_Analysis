return function (self) 
local parents = {self.Items1, self.Items2, self.Items3, self.Items4, self.Items5}
for t=1,5 do
	local items = {}
	local container = parents[t]:GetChildByName("Container")
	for i=1,96 do
		local slot = _SpawnService:SpawnByModelId("model://57d3c543-ce4a-4ba4-b2d7-b7fb837a16c6", string.format("Slot %d-%d", t,i), Vector3.zero, container)
		slot.ItemElementComponent.IconRaw = false
		items[i] = slot
	end
	self.Slots[t] = items
	self.Containers[t] = container
end
end