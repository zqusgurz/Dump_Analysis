return function (self,pool,objName,modelId,pos,parent,enable) 
if (#pool == 0) then
	local ret = _SpawnService:SpawnByModelId(modelId, objName, pos, parent)
	if not (enable) then
		ret.Enable = false
	end
	return ret, true
else
	---@type Entity
	local entity = table.remove(pool, 1)
	if (not isvalid(entity)) then
		return self:PickEx(pool, objName, modelId, pos, parent, enable)
	end
	local t = entity.TransformComponent
	if (isvalid(t)) then
		t.WorldPosition = pos:Clone()
	end
	if (enable) then
		entity.Enable = true
	end
	if (parent and entity.Parent ~= parent) then
		entity:AttachTo(parent)
	end
	return entity, false
end
end