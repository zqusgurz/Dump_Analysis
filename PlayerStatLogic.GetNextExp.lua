return function (self,level) 
if (level > self.MaxLevel) then
	return 2147483647
end
if (level < 1) then
	return 1
end
self:_CalcExpTable()
return self.ExpTable[level]
end