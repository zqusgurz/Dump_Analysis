return function (self,mob,pos) 
local footholds = mob.CurrentMap.FootholdComponent
pos.y = pos.y + 0.02
local fhId = nil
local fh = footholds:Raycast(pos, Vector2.down, 0.3)
if (fh ~= nil) then
	fhId = fh.Id
	local y = fh:GetYByX(pos.x)
	if (math.abs(pos.y - y) < 0.1) then
		pos.y = y + 0.01
	else
		fhId = nil
	end
end
return fhId
end