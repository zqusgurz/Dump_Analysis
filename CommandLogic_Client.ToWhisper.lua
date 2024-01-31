return function (self,user,argc,args) 
local chatSystem = _AppService:Get().ChatSystem
if (argc < 2) then
	if (chatSystem.LastReceivedWhisperFrom ~= "") then
		chatSystem:OnTypeWhisperTarget(chatSystem.LastReceivedWhisperFrom)
		return true
	end
	return false
else
	chatSystem:OnTypeWhisperTarget(args[2])
	return true
end
end