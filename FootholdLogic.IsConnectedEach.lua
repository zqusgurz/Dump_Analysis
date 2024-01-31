return function (self,map,fh1,fh2) 
local fh = map.FootholdComponent
local fh1Obj = fh:GetFoothold(fh1)
local fh2Obj = fh:GetFoothold(fh2)
if (fh1Obj == nil or fh2Obj == nil) then
	return false
end
return fh1Obj.OwnerId == fh2Obj.OwnerId
end