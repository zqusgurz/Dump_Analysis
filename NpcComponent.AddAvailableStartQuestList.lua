return function (self) 
local ret = {"#fUI/UIWindow.img/UtilDlgEx/list1::#\n"}
for id,_ in pairs(self.LocalQuest_AvailableStart) do
	ret[#ret + 1] = string.format("#L%d# %s #l", id, _QuestMan.QuestName[id])
end
if (#ret == 1) then
	return ""
end
return table.concat(ret, "\n")
end