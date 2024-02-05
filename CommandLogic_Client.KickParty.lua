return function (self,user,argc,args) 
if (argc < 2) then
	return false
end
local name = args[2]
if (_Slangs:IsValidCharacterName(name)) then
	_PartyProcessorLogic:KickPartyMember(_UserService.LocalPlayer, name)
end
return true
end