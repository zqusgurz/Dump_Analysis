return function (self) 
if (self.Disabled or self.LoginEngine.MoveStepTween ~= nil) then
	return
end
for i=1,self.Max do
	---@type Entity
	local entity = self.Entries[i]
	local entry = entity.CharacterSelectEntryComponent
	if (entry.Selected) then
		self:DoSelectCharacter(entry)
		return
	end
end
end