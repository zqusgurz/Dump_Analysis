return function (self,info) 
self.LastReactorGenerated = _UtilLogic.ServerElapsedSeconds

local reactorGens = self.Entity:GetChildComponentsByTypeName(_Types:Get(ReactorGenComponent), true)
self.ReactorGens = {table.unpack(reactorGens)}
for _,gen in ipairs(self.ReactorGens) do
	---@type ReactorGenComponent
	local reactorGen = gen
	reactorGen:NewRegenTime()
end
end