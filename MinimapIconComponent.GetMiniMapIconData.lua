return function (self,type) 
local ruid = ""
local spriteSize = Vector2.zero
if (type == _MinimapIconType.Npc) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/npc")
	spriteSize = Vector2(4,7)
elseif (type == _MinimapIconType.Portal) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/portal")
	spriteSize = Vector2(8,8)
elseif (type == _MinimapIconType.Other) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/another")
	spriteSize = Vector2(5,5)
elseif (type == _MinimapIconType.Party) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/party")
	spriteSize = Vector2(5,5)
elseif (type == _MinimapIconType.PartyMaster) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/partymaster")
	spriteSize = Vector2(5,9)
elseif (type == _MinimapIconType.User) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/user")
	spriteSize = Vector2(6,6)
elseif (type == _MinimapIconType.StartNpc) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/startnpc")
	spriteSize = Vector2(4,13)
elseif (type == _MinimapIconType.EndNpc) then
	ruid = _UidMan:Get("Map/MapHelper.img/minimap/endnpc")
	spriteSize = Vector2(4,13)
end
return MiniMapIconData(ruid, spriteSize)
end