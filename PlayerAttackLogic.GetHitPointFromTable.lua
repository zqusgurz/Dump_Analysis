return function (self,mob,hitPtTable,attackBox) 
---@type Vector2
local hitPt
if (hitPtTable ~= nil and hitPtTable[mob.Id] ~= nil) then
	hitPt = hitPtTable[mob.Id]
	--log("hitPt=", hitPt)
else
	hitPt = mob.MobComponent:GetHitPointByBox(attackBox)
	--log("calcHitPt=", hitPt, hitPtTable, attackBox.Position, attackBox.Size)
end
return hitPt
end