return function (self) 
_EditorService:GetCurrentMap(function(mapId)
	local presets = _DataService:GetTable("NpcModel")
	local parent = _EntityService:GetEntityByPath(string.format("/maps/%s", mapId))
	for i=1,presets:GetRowCount() do
		local id = presets:GetCell(i, 1)
		local model = presets:GetCell(i, 2)
		if (_UtilLogic:IsNilorEmptyString(model)) then
			-- 누락
			continue		
		end
		---@type Entity
		local obj = nil
		pcall(function()
			obj = _SpawnService:SpawnByModelId(model, "Temp", Vector3.zero, parent)			
		end)
		if (obj == nil) then
			continue				
		end
		pcall(function()
			local npc = obj.StateAnimationComponent
			local hasStand, stand = npc.ActionSheet:TryGetValue("stand")
			local hasShop, shop = npc.ActionSheet:TryGetValue("shop")
			if (hasStand) then
				_EditorService:DataSetSetCell("NpcModel", i, "stand", stand)
			end
			if (hasShop) then
				_EditorService:DataSetSetCell("NpcModel", i, "shop", shop)	
			end
		end)
		obj:Destroy()
	end
	log("finish")
end)
end