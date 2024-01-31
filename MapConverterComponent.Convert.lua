return function (self,obj,map) 
self:ParseMapInfo(obj, map)
self:ParseMinimap(obj, map)

for i=0,7 do
	self:ParseLayer(obj.Children[tostring(i)], map, i)
end

local l1 = map:GetChildByName("MapleMapLayer")
if (isvalid(l1)) then _EntityService:Destroy(l1) end
local l2 = map:GetChildByName("TileMap")
if (isvalid(l2)) then _EntityService:Destroy(l2) end

end