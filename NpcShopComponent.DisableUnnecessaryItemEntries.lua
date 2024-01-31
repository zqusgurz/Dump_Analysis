return function (self,entries,separators,needCount,totalCount) 
for i=needCount+1,totalCount do
	---@type Entity
	local entry = entries[i]
	---@type Entity
	local separator = separators[i]
	if (entry) then
		entry.Enable = false
	end
	if (separator) then
		separator.Enable = false
	end
end
end