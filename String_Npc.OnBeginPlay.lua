return function (self) 
if (not _DebugConstants.LoadString) then
	return
end
if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("문자열(엔피시)"))
end
local time = _UtilLogic.ElapsedSeconds
local item = _DataService:GetTable("NpcString")
local strings = self.Strings
local function AddNpcData(k, t)
	strings[k] = t
end
for i=1,item:GetRowCount() do
	local key = item:GetCell(i, 1)
	if (key == "") then continue end
	local obj = _HttpService:JSONDecode(item:GetCell(i, 2))
	AddNpcData(tonumber(key), obj)
end
_Log:Info(string.format("Loaded strings Npc.img time: %.2f secs", _UtilLogic.ElapsedSeconds - time))
end