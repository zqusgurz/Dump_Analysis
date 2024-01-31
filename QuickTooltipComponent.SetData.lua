return function (self,lt,rb,title,desc) 
_EntityUtils:ExecuteCheckUIMemoryChildren(self.Entity, nil, -1)
_EntityUtils:CheckUIMemory(self.Entity, nil, -1)

self.Title = title
self.Desc = desc

_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity, lt.x, -lt.y)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, rb.x - lt.x, rb.y - lt.y)

if (_UtilLogic:IsNilorEmptyString(desc)) then
	self.TooltipType = _TooltipType.Mini
else
	self.TooltipType = _TooltipType.Function
end

end