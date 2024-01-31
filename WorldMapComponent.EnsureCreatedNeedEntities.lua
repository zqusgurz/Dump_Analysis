return function (self,linkNum,spotNum,pathNum) 
---@param entities table<Entity>
local function checkEntities(entities, needNum, modelId, name, parent, setAlphaZero)
	local entitiesNum = #entities
	for i=entitiesNum+1,needNum do
		local newModel = _SpawnService:SpawnByModelId(modelId, name, Vector3.zero, parent)
		newModel.Enable = false
		newModel.Visible = false
		entities[i] = newModel
	end
	for i=needNum+1,entitiesNum do
		entities[i].Enable = false
		entities[i].Visible = false
		if (setAlphaZero) then
			entities[i].SpriteGUIRendererComponent.Color.a = 0
		end
	end
end

checkEntities(self.LinksEntities, linkNum, "model://c55e6780-580d-4566-aca1-3087037785db", "MapLink", self.Base, false)
checkEntities(self.SpotEntities, spotNum, "model://a735f4e4-2b95-4821-a101-26c634a7370b", "MapSpot", self.Spot, false)
checkEntities(self.PathEntities, pathNum, "model://aa98de8b-41d2-479d-a089-7746a6800394", "MapPath", self.Path, true)
end