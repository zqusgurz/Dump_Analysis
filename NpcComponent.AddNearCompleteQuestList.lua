return function (self) 
local ret = {"#fUI/UIWindow.img/UtilDlgEx/list3::#\n"}
for id,_ in pairs(self.LocalQuest_NearComplete) do
	ret[#ret + 1] = string.format("#L%d# %s (완료가능)#l", id, _QuestMan.QuestName[id])
end
if (#ret == 1) then
	return ""
end
return table.concat(ret, "\n")
end