return function (self,id) 
if (self.Unavailables[id]) then
    return false
end
---@type QuestInfo
local info = _QuestMan.Info[id]
if (info == nil) then
	return false
end
if (info.Area ~= 10 and info.Area ~= 20 and info.Area ~= 30 and info.Area ~= 40 and info.Area ~= 50) then
    return false
end
return true
end