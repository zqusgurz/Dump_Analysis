return function (self,party,user,lt,rb,left) 
local ret = {}
if (party ~= nil) then
	local userPos = user.TransformComponent.WorldPosition:ToVector2()
	local center, size = _NumberUtils:GetTriggerBoxFromLtRb(lt, rb, left)
	local members = party.Member
	for i=1,_PartyLogic.MaxPartyMember do
		---@type PartyMember
		local mem = members[i]
		if (mem and mem.Map == user.CurrentMapName) then
			local partyUser
			if (self:IsServer()) then
				partyUser = _UserDictionary.Users[mem.Id]
			else
				partyUser = _UserDictionary:FindUserInMap(mem.Id)
			end
			if (not isvalid(partyUser)) then
                --log("not valid party user ", mem.Id, " / ", mem.CharacterName)
				continue
			end
			local partyUserPos = partyUser.TransformComponent.WorldPosition:ToVector2()
			if (_NumberUtils:InBox(userPos, center, size, partyUserPos, 0)) then
				ret[#ret + 1] = partyUser
                --log ("Add party user ", mem.Id)
			else
                --log ("Not in bound ", mem.Id)
			end
		elseif (mem) then
            --log(string.format("Different map? name:%s myMap:%s memMap:%s",
            --        mem.CharacterName, user.CurrentMapName, mem.Map))
		else
            --log(string.format("member index %d is empty", i))
		end
	end
else
	ret[1] = user
end
return ret
end