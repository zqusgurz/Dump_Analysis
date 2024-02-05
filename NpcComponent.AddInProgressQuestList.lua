return function (self) 
local ret = {"#fUI/UIWindow.img/UtilDlgEx/list0::#\n"}
for id,_ in pairs(self.LocalQuest_InProgress) do
	ret[#ret + 1] = string.format("#L%d# %s (진행중)#l", id, _QuestMan.QuestName[id])
end
if (#ret == 1) then
	return ""
end
return table.concat(ret, "\n")
end