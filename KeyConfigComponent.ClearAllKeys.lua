return function (self) 
for key,entities_ in pairs(self.Keys) do
	---@type table<Entity>
	local entities = entities_
	for _,entity in ipairs(entities) do
		self:UpdateIcon(entity, nil)
	end
end
end