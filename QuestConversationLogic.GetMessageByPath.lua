return function (self,state,path) 
local keys = {}
for key in string.gmatch(path, "[^/]+") do
	keys[#keys + 1] = key
end

local currentTable = _QuestMan.Say[state.QuestId]

for i=1,#keys do
	if (currentTable == nil) then
		return nil
	end
	currentTable = currentTable[keys[i]]
end

if currentTable == nil then
	return nil
else
	return currentTable
end
end