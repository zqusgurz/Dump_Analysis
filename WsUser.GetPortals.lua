return function (self,mapName,portal) 
local targets = {}
local targetsIndex = 1
if (_UtilLogic:IsNilorEmptyString(portal) or portal == "sp") then
	local mapPath = string.format("/maps/%s", mapName)
	local map = _EntityService:GetEntityByPath(mapPath)
	if (isvalid(map)) then
		-- Get by SpawnLocationComponent
		local spawnPositions = map:GetChildComponentsByTypeName(_Types:Get(SpawnLocationComponent), true)
		for _,p in ipairs(spawnPositions) do
			targets[targetsIndex] = p.Entity
			targetsIndex += 1
		end
		-- Get by Pt == 0
		local portals = map:GetChildComponentsByTypeName(_Types:Get(MaplePortalComponent), true)
		for _,p in ipairs(portals) do
			---@type MaplePortalComponent
			local pp = p
			if (pp.Pt == _PortalType.StartPoint) then
				targets[targetsIndex] = pp.Entity
				targetsIndex += 1
			end
		end
	end
else
	local path = string.format("/maps/%s/Portals/%s", mapName, portal)
	targets = _EntityService:GetEntitiesByPath(path)
	if (#targets == 0) then -- fallback
		return self:GetPortals(mapName, "")
	end
end
return targets
end