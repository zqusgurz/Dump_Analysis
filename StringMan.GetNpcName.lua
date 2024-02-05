return function (self,npcId) 
if (npcId == nil) then
	return ""
end
if (npcId // 10000 == 990) then
	return _ImitationNpcLogic:GetImitationNpcName(npcId)
end
local n = _String_Npc.Strings[npcId]
if (n ~= nil) then
	return n["name"] or "Unknown"
end
return "알 수 없음"
end