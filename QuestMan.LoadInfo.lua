return function (self,id,info) 
---@type QuestInfo
local n = {}

n.Id = id
n.Area = _WzUtils:GetInt32(info["area"], 0)
n.TimeLimit = _WzUtils:GetInt32(info["timeLimit"], 0)
n.Order = _WzUtils:GetInt32(info["order"], -1)
n.State = {
	[0] = _WzUtils:GetString(info["0"], ""),
	[1] = _WzUtils:GetString(info["1"], ""),
	[2] = _WzUtils:GetString(info["2"], "")
}
n.ViewMedalItem = _WzUtils:GetInt32(info["viewMedalItem"], 0)
n.Name = _WzUtils:GetString(info["name"], "")
n.Parent = _WzUtils:GetString(info["parent"], "")
n.AutoPreComplete = _WzUtils:GetBool(info["autoPreComplete"], false)
n.AutoStart = _WzUtils:GetBool(info["autoStart"], false)
n.SelectedMob = _WzUtils:GetBool(info["selectedMob"], false)

return n
end