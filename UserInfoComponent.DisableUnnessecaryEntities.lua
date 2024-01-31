return function (self,currentIndex) 
local entries = self.ItemEntries
local entriesNum = #entries
for i=currentIndex+1,entriesNum do
	---@type Entity
	local entity = entries[i]
	entity.Enable = false
	entity.Visible = false
end
end