return function (self) 
local dsAct = _DataService:GetTable("Quest.Act")
local dsCheck = _DataService:GetTable("Quest.Check")
local dsInfo = _DataService:GetTable("Quest.QuestInfo")

for i=1,dsInfo:GetRowCount() do
	local idString = dsInfo:GetCell(i, 1)
	local id = tonumber(idString)
	local info = _HttpService:JSONDecode(dsInfo:GetCell(i, 2))
	local act, demand = nil, nil
	local actRow = dsAct:FindRow("Key", idString)
	if (actRow ~= nil) then
		act = _HttpService:JSONDecode(actRow:GetItem("Json"))
	end
	local demandRow = dsCheck:FindRow("Key", idString)
	if (demandRow ~= nil) then
		demand = _HttpService:JSONDecode(demandRow:GetItem("Json"))
	end
	self:LoadOne(id, act, demand, info)
	self.QuestNum += 1
end

local dsArea = _DataService:GetTable("QuestCategory")
for i=1,dsArea:GetRowCount() do
	local id = tonumber(dsArea:GetCell(i, 1))
	local name = dsArea:GetCell(i, 2)
	self.AreaName[id] = name
end
end