return function (self,origin,lt,rb,left) 
local center, size = _NumberUtils:GetTriggerBoxFromLtRb(lt, rb, left)
return BoxShape(origin + center, size, 0)
end