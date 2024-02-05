return function (self,user,argc,args) 
local multiplier = 1.0
if (argc > 1) then
	multiplier = tonumber(args[2])
	if (multiplier == nil) then
		_ChatMessageLogic:Add(_ChatMessageType.Red, "Invalid multiplier")
		return false
	end
end
user.PlayerHitComponent:SetImpact(true, true, multiplier)
_ChatMessageLogic:Add(_ChatMessageType.Red, "Applied SetImpact")
end