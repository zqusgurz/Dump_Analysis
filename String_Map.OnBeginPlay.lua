return function (self) 
if (not _DebugConstants.LoadString) then
	return
end
if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("문자열(맵)"))
end
local time = _UtilLogic.ElapsedSeconds
local item = _DataService:GetTable("MapString")
local mapNames = _StringMan.MapStringMapName
local streetNames = _StringMan.MapStringStreetName
local mapDesc = _StringMan.MapStringDesc
local function AddMapData(key, t)
	local k = string.format("m%09d", tonumber(key))
	mapNames[k] = t.mapName
	streetNames[k] = t.streetName
	mapDesc[k] = t.mapDesc
end
for i=1,item:GetRowCount() do
	local key = item:GetCell(i, 1)
	if (key == "") then continue end
	local obj = _HttpService:JSONDecode(item:GetCell(i, 2))
	local success,_ = pcall(AddMapData, key, obj)
	if (not success) then
		log_error(string.format("failed to add map string key %s", key))
	end
end
_Log:Info(string.format("Loaded strings Map.img time: %.2f secs", _UtilLogic.ElapsedSeconds - time))
if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText("기타 데이터")
end
end