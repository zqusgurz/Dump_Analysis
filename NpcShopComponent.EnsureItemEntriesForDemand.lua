return function (self,entries,separators,parentContainer,listCount) 
for i=#entries+1,listCount do
	if (i > 1) then
		local sep = _SpawnService:SpawnByModelId("model://a64c9d8c-3f64-479c-80dd-cd2def82c10e", "Separator", Vector3.zero, parentContainer)
		_EntityUtils:SetPositionUIEntitySafelyEx(sep, nil, -((i - 1) * 39 - 2))
		separators[#separators + 1] = sep
	end
	local entry = _SpawnService:SpawnByModelId("model://fc1389ab-99d8-4e35-a3f7-46c8217e846e", "NpcShopItemEntry", Vector3.zero, parentContainer)
	_EntityUtils:SetPositionUIEntitySafelyEx(entry, nil, -((i - 1) * 39))
	entries[#entries + 1] = entry
end
end