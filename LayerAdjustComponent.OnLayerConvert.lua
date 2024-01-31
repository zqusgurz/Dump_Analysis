return function (self,mapId) 
local map = _EntityService:GetEntityByPath(string.format("/maps/%s", mapId))
local count = 0
for i=0,7,1 do
	local layer = map:GetChildByName(string.format("c%d", i))
	if (layer == nil) then
		continue
	end
	count += self:ConvertObjs(i, layer:GetChildByName("Objs"), mapId == "m100000000")
	count += self:ConvertTiles(i, layer:GetChildByName("Tiles"), mapId == "m100000000")
end
_EditorService:Notification(string.format("%d개의 객체의 레이어를 조정했습니다.", count))
_EditorService:SaveMap()
end