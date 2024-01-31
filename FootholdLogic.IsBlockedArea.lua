return function (self,map,fhId1,fhId2,pos) 
local fh1 = map.FootholdComponent:GetFoothold(fhId1)
local fh2 = map.FootholdComponent:GetFoothold(fhId2)

local v1 = fh1.EndPoint - fh1.StartPoint
local v2 = fh2.EndPoint - fh1.StartPoint
local v9 = _NumberUtils:CrossProduct(v1, v2)
local c1 = _NumberUtils:CrossProduct(pos - fh1.StartPoint, fh1.EndPoint - fh1.StartPoint)
local c2 = _NumberUtils:CrossProduct(pos - fh2.StartPoint, fh2.EndPoint - fh2.StartPoint)
if (v9 <= 0) then
    if (c1 <= 0 and c2 >= 0) then
        return false
    end
else
    if (c1 <= 0 or c2 >= 0) then
        return false
    end
end
return true
end