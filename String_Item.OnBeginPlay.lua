return function (self) 
if (not _DebugConstants.LoadString) then
	return
end
if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("문자열(아이템)"))
end
local time = _UtilLogic.ElapsedSeconds
local item = _DataService:GetTable("ItemString")
local descs = _StringMan.ItemStringDesc
local descsD = _StringMan.ItemStringDescD
local names = _StringMan.ItemStringName
local function AddItemData(key, t)
	local k = tonumber(key)
	if (t.desc) then
		descs[k] = t.desc
	end
	if (t.descD) then
		descsD[k] = t.descD
	end
	if (t.name) then
		names[k] = t.name
	end
end
local decode = _HttpService.JSONDecode
local http = _HttpService
for i,row in ipairs(item:GetAllRow()) do
	local key = row:GetItem("Key")
	local json = row:GetItem("Json")
	xpcall(function() 
		local obj = decode(http, json)
		AddItemData(key, obj)
	end, function(err)
		log_error(string.format("failed to add item string key '%s' (%s)", key, json))
	end)
    --if (success) then
    --    
    --else
    --    log_error(string.format("failed to add item string key '%s' (%s)", key, json))
    --end
    --if (_UtilLogic:IsNilorEmptyString(key) or _UtilLogic:IsNilorEmptyString(json)) then continue end
    --local obj = _HttpService:JSONDecode(json)
    --AddItemData(key, obj)
    --local success,_ = pcall(AddItemData, key, obj)
    --if (not success) then
    --    log_error(string.format("failed to add item string key %s", key))
    --end
end

local customItem = _DataService:GetTable("CustomItemString")
for i,row in ipairs(customItem:GetAllRow()) do
	local k = tonumber(row:GetItem("item"))
	if (k == nil) then continue end
	descs[k] = _WzUtils:GetString(row:GetItem("desc"), "")
	names[k] = _WzUtils:GetString(row:GetItem("name"), "")
end

--for i=1,item:GetRowCount() do
--    local key = item:GetCell(i, 1)
--    if (key == "") then continue end
--    local obj = _HttpService:JSONDecode(item:GetCell(i, 2))
--    local success,_ = pcall(AddItemData, key, obj)
--    if (not success) then
--        log_error(string.format("failed to add item string key %s", key))
--    end
--end
_Log:Info(string.format("Loaded strings Item.img time: %.2f secs", _UtilLogic.ElapsedSeconds - time))
end