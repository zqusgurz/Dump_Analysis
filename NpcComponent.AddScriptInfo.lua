return function (self) 
local ret = {"#fUI/UIWindow.img/UtilDlgEx/list2::#\n"}
local template = _NpcTemplateMan:GetNpcTemplate(self.NpcTemplateID)
if (not _UtilLogic:IsNilorEmptyString(template.Script)) then
	local ds = _DataService:GetTable("ScriptInfo")
	local row = ds:FindRow("script", template.Script)
	if (row ~= nil) then
		ret[#ret + 1] = string.format("#L0# %s#l", row:GetItem("desc"))
	else
		ret[#ret + 1] = string.format("#L0# %s#l", template.Script)
	end
end
if (#ret == 1) then
	return ""
end
return table.concat(ret, "\n")
end