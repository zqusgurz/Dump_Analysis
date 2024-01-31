return function (self,layer,map,layerId) 
if (layer == nil) then
	return
end

local lname = string.format("L%d", layerId)
local layerEntity = map:GetChildByName(lname)
if not (isvalid(layerEntity)) then
	_SpawnService:SpawnByModelId("model://maplemaplayer", lname, Vector3.zero, map)
end
end