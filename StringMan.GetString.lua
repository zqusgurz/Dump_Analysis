return function (self,key) 
if (not self._T.LoadedCustomString) then
	local ds = _DataService:GetTable("StringData")
	local t = self.CustomStringData
	for i=1,ds:GetRowCount() do
		t[ds:GetCell(i,1)] = ds:GetCell(i,2)
	end
	self._T.LoadedCustomString = true
end
return self.CustomStringData[key] or ""
end