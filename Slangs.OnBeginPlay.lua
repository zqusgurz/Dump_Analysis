return function (self) 
local fds = _DataService:GetTable("ForbiddenName")
local fn = self.ForbiddenName
for i=1,fds:GetRowCount() do
	fn[i] = fds:GetCell(i, 2)
end

local sds = _DataService:GetTable("Curse")
local sn = self.Slang
for i=1,sds:GetRowCount() do
	sn[i] = {sds:GetCell(i, 1), sds:GetCell(i, 2)}
end
end