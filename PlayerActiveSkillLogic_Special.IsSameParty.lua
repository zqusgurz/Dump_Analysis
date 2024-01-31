return function (self,from,target) 
if (from == target) then
	return true
end
local fromPartyId = from.WsUser.PartyId
local targetPartyId = target.WsUser.PartyId
if (fromPartyId == 0 or targetPartyId == 0) then
	return false
end
return fromPartyId == targetPartyId
end